import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tempreture/controller/fivedayScreenController.dart';
import 'package:tempreture/model/api_module.dart';
import 'package:tempreture/view/5dayforcast.dart';
import 'package:tempreture/view/widgets/loading.dart';
import 'package:tempreture/view/widgets/weathericons.dart';

import '../favCities.dart';
import '../search_screem.dart';
import 'detailbox.dart';
import 'screenchange.dart';

var city = "riyadh";
dynamic backgroundScreen = "assets/night.jpg";
var temp = "";

class WeatherDetail extends StatefulWidget {
  const WeatherDetail({Key? key}) : super(key: key);

  @override
  _WeatherDetailState createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  @override
  Widget build(BuildContext context) {
    FiveDayController fiveDayController =
        Get.put(FiveDayController(), permanent: true);
    Future<ApiModule> getApi(cityname) async {
      final response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=57fdfdc1554c3a6bd4d58b1cc730ec5c"));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return ApiModule.fromJson(data);
      } else {
        return ApiModule.fromJson(data);
      }
    }

    return Scaffold(
      backgroundColor: Color(0xff2e2e2e),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.to(FavCities());
          },
          icon: Icon(Icons.add),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                var searchCity = await Get.to(SerchScreen(),
                    duration: Duration(milliseconds: 350),
                    curve: Curves.easeInOut,
                    transition: Transition.fadeIn);
                setState(() {
                  city = searchCity[0];
                });
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Stack(children: <Widget>[
        FutureBuilder<ApiModule>(
            future: getApi(city),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Loading();
              } else {
                fiveDayController.city = city;
                fiveDayController.lat = snapshot.data!.coord!.lat;
                fiveDayController.lon = snapshot.data!.coord!.lon;
                return Stack(children: [
                  ScreenChanger(
                    snapshot.data!.weather![0].main.toString().toLowerCase(),
                  ),
                  Container(
                      color: Colors.black.withOpacity(0.19),
                      width: double.infinity,
                      height: double.infinity),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 110, left: 22),
                        child: Row(
                          children: [
                            Text(
                              snapshot.data!.name.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 32),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 24),
                        child: Text(
                          " ${DateTime.now().hour}:${DateTime.now().minute} pm ",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(fiveDayForcast(),
                              duration: Duration(milliseconds: 550),
                              curve: Curves.easeInOut,
                              transition: Transition.fadeIn);
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.transparent),
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40))),
                              margin: EdgeInsets.fromLTRB(32, 22, 32, 22),
                              height: MediaQuery.of(context).size.height * 0.08,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 42, 0, 0),
                              child: Center(
                                child: Text(
                                  "7 day Forcaste",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white,
                                    fontSize: 21,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 22),
                        child: Row(
                          children: [
                            Text(
                              (snapshot.data!.main!.temp! - 273.0)
                                  .toStringAsFixed(0),
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  fontSize: 52),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "\u2103",
                              style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white,
                                  fontSize: 52),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            weatherIcons(
                              snapshot.data!.weather![0].main
                                  .toString()
                                  .toLowerCase(),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 29),
                        child: Text(
                          snapshot.data!.weather![0].description
                              .toString()
                              .toLowerCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: GridView.count(
                          primary: false,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          crossAxisCount: 2,
                          children: <Widget>[
                            detailBox(
                                "Real Feel",
                                (snapshot.data!.main!.feelsLike! - 273.0)
                                        .toStringAsFixed(0) +
                                    "\u2103",
                                Icons.thermostat_auto),
                            detailBox("Pressure", snapshot.data!.main!.pressure,
                                Icons.air_outlined),
                            detailBox(
                                'Humidity',
                                snapshot.data!.main!.humidity.toString() + "%",
                                Icons.water),
                            detailBox("Visiblity", snapshot.data!.visibility,
                                Icons.remove_red_eye),
                            detailBox(
                                "Wind Speed",
                                snapshot.data!.wind!.speed.toStringAsFixed(1) +
                                    " m/s",
                                Icons.speed_sharp),
                            detailBox("Wind Degree", snapshot.data!.wind!.deg,
                                Icons.rotate_90_degrees_ccw)
                          ],
                        ),
                      )
                    ],
                  ),
                ]);
              }
            }),
      ]),
    );
  }
}

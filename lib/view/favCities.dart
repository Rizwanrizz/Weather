import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tempreture/controller/favScreenControoler.dart';
import 'package:tempreture/controller/fivedayScreenController.dart';
import 'package:tempreture/model/api_module.dart';
import 'package:tempreture/view/5dayforcast.dart';
import 'package:tempreture/view/widgets/cardweather.dart';
import 'package:tempreture/view/widgets/nocity_add.dart';

class FavCities extends StatefulWidget {
  const FavCities({Key? key}) : super(key: key);

  @override
  _FavCitiesState createState() => _FavCitiesState();
}

class _FavCitiesState extends State<FavCities> {
  @override
  Widget build(BuildContext context) {
    FiveDayController fiveDayController =
        Get.put(FiveDayController(), permanent: true);
    Future<ApiModule> getApi(cityname) async {
      final response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=${cityname}&appid=57fdfdc1554c3a6bd4d58b1cc730ec5c"));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return ApiModule.fromJson(data);
      } else {
        return ApiModule.fromJson(data);
      }
    }

    return Scaffold(
        backgroundColor: Color(0xff1c1c1c),
        appBar: AppBar(
          title: Text(
            "Manage Cities",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: GetX<FavCityController>(
            init: FavCityController(),
            builder: (controller) {
              return controller.favcitylst.length == 0
                  ? NoCityfound()
                  : ListView.builder(
                      itemCount: controller.favcitylst.length,
                      itemBuilder: (context, index) {
                        return FutureBuilder<ApiModule>(
                          future: getApi(controller.favcitylst[index]),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Text("loading");
                            } else {
                              return Dismissible(
                                key: Key(controller.favcitylst[index]),
                                onDismissed: (direction) {
                                  controller.favcitylst.removeAt(index);
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    fiveDayController.city =
                                        controller.favcitylst[index];
                                    fiveDayController.lat =
                                        snapshot.data!.coord!.lat;
                                    fiveDayController.lon =
                                        snapshot.data!.coord!.lon;
                                    Get.to(fiveDayForcast());
                                  },
                                  child: CardWeather(
                                    context,
                                    snapshot.data!.weather![0].main
                                        .toString()
                                        .toLowerCase(),
                                    controller.favcitylst[index],
                                    (snapshot.data!.main!.temp! - 273.0)
                                        .toStringAsFixed(0),
                                    snapshot.data!.weather![0].description
                                        .toString()
                                        .toLowerCase(),
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      });
            }));
  }
}

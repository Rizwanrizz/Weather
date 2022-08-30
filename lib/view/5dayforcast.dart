import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tempreture/controller/fivedayScreenController.dart';
import 'package:tempreture/view/widgets/eachdayCard.dart';
import 'package:tempreture/view/widgets/loading.dart';

import 'widgets/weathericons.dart';

class fiveDayForcast extends StatefulWidget {
  const fiveDayForcast({Key? key}) : super(key: key);

  @override
  _fiveDayForcastState createState() => _fiveDayForcastState();
}

class _fiveDayForcastState extends State<fiveDayForcast> {
  @override
  Widget build(BuildContext context) {
    FiveDayController fiveDayController =
        Get.put(FiveDayController(), permanent: true);
    var data;
    var city = fiveDayController.city;
    var lat = fiveDayController.lat;
    var lon = fiveDayController.lat;
    Future<void> getFiveDayApi() async {
      final response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,minutely,current&appid=57fdfdc1554c3a6bd4d58b1cc730ec5c"));

      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());
      } else {
        //
      }
    }

    return Scaffold(
      backgroundColor: Color(0xff1c1c1c),
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.w200, fontSize: 19),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: getFiveDayApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Loading();
            } else {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 22, 00, 0),
                    child: Text(
                      "7 day forcaste of $city ",
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                          fontSize: 25),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return EachDayCard(
                              context,
                              index,
                              (data["daily"][index]["temp"]["day"] - 273),
                              (data["daily"][index]["temp"]["night"] - 273),
                              data["daily"][index]["rain"],
                              data["daily"][index]["uvi"],
                              data["daily"][index]["clouds"],
                              data["daily"][index]["pop"]);
                        }),
                  )
                ],
              );
            }
          }),
    );
  }
}

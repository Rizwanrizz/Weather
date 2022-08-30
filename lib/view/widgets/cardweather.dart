import 'package:flutter/material.dart';
import 'package:tempreture/view/widgets/weathericons.dart';

Widget CardWeather(
    BuildContext context, weather, city, temperature, weatherDiscription) {
  return Container(
    margin: EdgeInsets.all(9),
    child: Stack(
      children: [
        CardScreenChanger(context, weather),
        Container(
          height: MediaQuery.of(context).size.height * 0.24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.black.withOpacity(0.17),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(22.0, 22, 0, 2),
              child: Row(
                children: [
                  Text(
                    city.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.w200),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  weatherIcons(weather.toString()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22.0, 22, 0, 2),
              child: Text(
                temperature + "\u2103",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 3, 0, 2),
              child: Text(
                weatherDiscription.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget CardScreenChanger(BuildContext context, condition) {
  if (condition == "haze") {
    return Container(
      height: MediaQuery.of(context).size.height * 0.24,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.blue,
          image: DecorationImage(
              image: AssetImage("assets/haze.jpg"), fit: BoxFit.cover)),
    );
  } else if (condition == "smoke") {
    return Container(
      height: MediaQuery.of(context).size.height * 0.24,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.blue,
          image: DecorationImage(
              image: AssetImage("assets/smoke.jpg"), fit: BoxFit.cover)),
    );
  } else if (condition == "mist") {
    return Container(
      height: MediaQuery.of(context).size.height * 0.24,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.blue,
          image: DecorationImage(
              image: AssetImage("assets/mist.jpg"), fit: BoxFit.cover)),
    );
  } else if (condition == "clear") {
    return Container(
      height: MediaQuery.of(context).size.height * 0.24,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.blue,
          image: DecorationImage(
              image: AssetImage("assets/clear.jpg"), fit: BoxFit.cover)),
    );
  } else if (condition == "clouds") {
    return Container(
      height: MediaQuery.of(context).size.height * 0.24,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.blue,
          image: DecorationImage(
              image: AssetImage("assets/cloud.jpg"), fit: BoxFit.cover)),
    );
  } else {
    return Container(
      height: MediaQuery.of(context).size.height * 0.24,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.blue,
          image: DecorationImage(
              image: AssetImage("assets/night.jpg"), fit: BoxFit.cover)),
    );
  }
}

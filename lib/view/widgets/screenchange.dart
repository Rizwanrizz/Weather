
import 'package:flutter/material.dart';

Widget ScreenChanger(condition) {
  if (condition == "haze") {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
      image: AssetImage(
        "assets/haze.jpg",
      ),
      fit: BoxFit.cover,
    )));
  } else if (condition == "smoke") {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
      image: AssetImage(
        "assets/smoke.jpg",
      ),
      fit: BoxFit.cover,
    )));
  }
  
  
  else if (condition == "mist") {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
      image: AssetImage(
        "assets/mist.jpg",
      ),
      fit: BoxFit.cover,
    )));
  }
  
  
  else if (condition == "clear") {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
      image: AssetImage(
        "assets/clear.jpg",
      ),
      fit: BoxFit.cover,
    )));
  }
  else if (condition == "clouds") {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
      image: AssetImage(
        "assets/cloud.jpg",
      ),
      fit: BoxFit.cover,
    )));
  }
  
  
  
   else {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
      image: AssetImage(
        "assets/night.jpg",
      ),
      fit: BoxFit.cover,
    )));
  }
}

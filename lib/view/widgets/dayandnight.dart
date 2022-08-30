
import 'package:flutter/material.dart';

Widget DayAndNigth(condition) {
  if (condition == "night") {
    return Image.asset(
      "assets/moon.png",
      width: 25,
      height: 25,
      fit: BoxFit.cover,
    );
  } else if (condition == "day") {
    return Image.asset(
      "assets/iclear.png",
      width: 32,
      height: 32,
      fit: BoxFit.cover,
    );
  } else {
    return Image.asset(
      "assets/else.png",
      width: 32,
      height: 32,
      fit: BoxFit.cover,
    );
  }
}

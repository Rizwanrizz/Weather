
import 'package:flutter/material.dart';

Widget weatherIcons(condition) {
  if (condition == "haze") {
    return Image.asset(
      "assets/ihaze.png",
      width: 42,
      height: 42,
      fit: BoxFit.cover,
    );
  } else if (condition == "smoke") {
    return Image.asset(
      "assets/ismoke.png",
      width: 42,
      height: 42,
      fit: BoxFit.cover,
    );
  } else if (condition == "mist") {
    return Image.asset(
      "assets/imist.png",
      width: 42,
      height: 42,
      fit: BoxFit.cover,
    );
  } else if (condition == "clear") {
    return Image.asset(
      "assets/iclear.png",
      width: 42,
      height: 42,
      fit: BoxFit.cover,
    );
  } else if (condition == "clouds") {
    return Image.asset(
      "assets/icloud.png",
      width: 42,
      height: 42,
      fit: BoxFit.cover,
    );
  } else {
    return Image.asset(
      "assets/else.png",
      width: 42,
      height: 42,
      fit: BoxFit.cover,
    );
  }
}

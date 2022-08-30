
import 'package:flutter/material.dart';

Widget detailBox(title, value, myIcon) {
  return Container(
    padding: const EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 12),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w300,
                fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18, left: 11),
          child: Icon(
            myIcon,
            color: Colors.white.withOpacity(0.95),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 12),
          child: Text(
            value.toString(),
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w300),
          ),
        ),
      ],
    ),
    color: Colors.black.withOpacity(0.1),
  );
}

import 'package:flutter/material.dart';

import 'dayandnight.dart';

Widget EachDayCard(
    BuildContext context, index, dayTemp, nightTemp, rain, uvi, clouds, pop) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.all(Radius.circular(30))),
    margin: EdgeInsets.fromLTRB(12, 62, 12, 100),
    width: MediaQuery.of(context).size.width * 0.4,
    height: MediaQuery.of(context).size.height * 0.2,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 32, 0, 0),
          child: Text(
            "${index + 1} day ago",
            style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 22,
                fontWeight: FontWeight.w300),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 22, 0, 12),
          child: DayAndNigth("day"),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 15),
          child: Text(
            "Day time",
            style: TextStyle(
                color: Colors.white, fontSize: 11, fontWeight: FontWeight.w300),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 2, 0, 0),
          child: Text(
            "${dayTemp.toStringAsFixed(0)} \u2103",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w200),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 31),
          height: 2,
          width: 52,
          color: Colors.white.withOpacity(0.55),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 22, 0, 12),
          child: DayAndNigth("night"),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 15),
          child: Text(
            "Night time",
            style: TextStyle(
                color: Colors.white, fontSize: 11, fontWeight: FontWeight.w300),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 2, 0, 0),
          child: Text(
            "${nightTemp.toStringAsFixed(0)} \u2103",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w200),
          ),
        ),
        SizedBox(
          height: 48,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Icon(
                Icons.water,
                color: Colors.white,
                size: 12,
              ),
            ),
            Text(
              "rain: ${rain}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w200),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 0, 5, 0),
              child: Icon(
                Icons.light_mode,
                color: Colors.white,
                size: 12,
              ),
            ),
            Text(
              "Uvi: ${uvi}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w200),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 0, 5, 0),
              child: Icon(
                Icons.cloud,
                color: Colors.white,
                size: 9,
              ),
            ),
            Text(
              "Cloud: ${clouds}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w200),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 0, 5, 0),
              child: Icon(
                Icons.water_damage,
                color: Colors.white,
                size: 12,
              ),
            ),
            Text(
              "Pop: ${pop}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w200),
            ),
          ],
        )
      ],
    ),
  );
}

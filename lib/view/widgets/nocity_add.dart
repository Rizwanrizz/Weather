import 'package:flutter/material.dart';

class NoCityfound extends StatelessWidget {
  const NoCityfound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Opacity(
            opacity: 0.9,
            child: Image(
                width: MediaQuery.of(context).size.width * 0.35,
                image: AssetImage("assets/ufo1.png")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(68, 18, 68, 1),
          child: Text(
            "You have not add any location yet",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24,
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }
}

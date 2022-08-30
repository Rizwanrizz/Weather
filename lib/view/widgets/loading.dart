import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2e2e2e),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SpinKitDancingSquare(size: 100, color: Colors.white),
          SizedBox(height: 8),
          Text(
            "Loading",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white.withOpacity(0.9)),
          )
        ],
      ),
    );
  }
}

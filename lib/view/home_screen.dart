import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tempreture/view/search_screem.dart';
import 'package:tempreture/view/widgets/weatherdetails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(SerchScreen(),
                    duration: Duration(milliseconds: 350),
                    curve: Curves.easeInOut,
                    transition: Transition.fadeIn);
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/night.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          //single weather wid++++ get
          SingleChildScrollView(
              physics: ScrollPhysics(), child: WeatherDetail())
        ],
      ),
    );
  }
}

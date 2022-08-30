import 'dart:convert';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:tempreture/model/api_module.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

//List<UserModel> userlst = [];

class _HomeState extends State<Home> {
  Future<ApiModule> getApi() async {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=riyadh&appid=57fdfdc1554c3a6bd4d58b1cc730ec5c"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ApiModule.fromJson(data);
    } else {
      return ApiModule.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apis"),
      ),
      body: Container(
        child: Column(
          children: [
            FutureBuilder<ApiModule>(
              future: getApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading");
                } else {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(snapshot.data!.visibility.toString()),
                          );
                        }),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

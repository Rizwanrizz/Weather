import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:tempreture/model/user_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

List<UserModel> userlst = [];
var data;

class _HomeState extends State<Home> {
  Future<void> getApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {
      //error code
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
            FutureBuilder(
              future: getApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                } else {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          var lct = userlst[index].address!.geo!.lat;
                          return ListTile(
                            title: Text(data[index]["name"].toString()),
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

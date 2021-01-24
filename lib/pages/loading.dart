import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {

    Response response = await get("http://worldtimeapi.org/api/timezone/Asia/Kolkata");
    Map data = jsonDecode(response.body);
    // print(data);

    //getting properties from data
    String datetime = data["datetime"];
    String offset = data["utc_offset"];
    int hoursInOffset = int.parse(offset.substring(1, 3));
    int minutesInOffset = int.parse(offset.substring(4,6));

    //print("$hoursInOffset : $minutesInOffset");

    DateTime now = DateTime.parse(datetime);
    //print(now);
    now = now.add(new Duration(hours: hoursInOffset));
    now = now.add(new Duration(minutes: minutesInOffset));
    print(now);

//    print(datetime);
//    print(offset);
  }

  @override
  void initState() {
    // implement initState
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading screen"),
    );
  }
}

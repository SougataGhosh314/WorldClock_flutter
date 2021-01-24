import 'package:flutter/material.dart';
import 'package:WorldClock_flutter/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  //String time = "loading...";

  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(location: 'Kolkata', flag: "India.png", url: "Asia/Kolkata");
    await worldTime.getTime();

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": worldTime.location,
      "flag": worldTime.flag,
      "time": worldTime.time,
      "isDay": worldTime.isDay
    });

    // print(worldTime.time);
//    setState(() {
//      time = worldTime.time;
//    });
  }

  @override
  void initState() {
    // implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100.0,
        ),
      )
    );
  }
}

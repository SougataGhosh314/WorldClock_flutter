import 'package:flutter/material.dart';
import 'package:WorldClock_flutter/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "loading...";

  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(location: 'Kolkata', flag: "India.png", url: "Asia/Kolkata");
    await worldTime.getTime();
    print(worldTime.time);
    setState(() {
      time = worldTime.time;
    });
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
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}

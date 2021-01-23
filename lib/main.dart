import 'package:WorldClock_flutter/pages/choose_location.dart';
import 'package:flutter/material.dart';
import 'package:WorldClock_flutter/pages/home.dart';
import 'package:WorldClock_flutter/pages/loading.dart';

void main() => runApp(MaterialApp(
    initialRoute: "/home",
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/choose_location": (context) => ChooseLocation()
    },
));

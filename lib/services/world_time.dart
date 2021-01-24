import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name to show
  String time; // time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDay;
  String date;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      Response response = await get(
          "http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);
      // print(data);

      //getting properties from data
      String datetime = data["datetime"];
      String offset = data["utc_offset"];
      int hoursInOffset = int.parse(offset.substring(1, 3));
      int minutesInOffset = int.parse(offset.substring(4, 6));

      //print("$hoursInOffset : $minutesInOffset");

      DateTime now = DateTime.parse(datetime);
      print(now);
      now = now.add(new Duration(hours: hoursInOffset));
      now = now.add(new Duration(minutes: minutesInOffset));

      // setting the time property
      this.time = DateFormat.jm().format(now);

      // setting the date property
      this.date = DateFormat.yMd().format(now);
      //print(date);

      // setting the isDay property
      this.isDay = now.hour > 6 && now.hour < 18 ? true : false;

    } catch (exception) {
      print("Caught error: $exception");
      time = "could not fetch time data";
    }

    // print(now);

//    print(datetime);
//    print(offset);
  }
}


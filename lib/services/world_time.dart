import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location; // location name to show
  String time; // time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    Response response = await get("http://worldtimeapi.org/api/timezone/$url");
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

    // setting the time property
    this.time = now.toString();

    // print(now);

//    print(datetime);
//    print(offset);
  }
}


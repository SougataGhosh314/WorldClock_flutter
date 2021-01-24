import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    //print(data["isDay"]);

    //set background
    String bgImage = data["isDay"] ? "day.jpg" : "night.png";
    Color bgColor = data["isDay"] ? Colors.blue[800] : Colors.black45;
    String flagImage = "assets/" + data["flag"];
    //print(flagImage);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$bgImage"),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, "/choose_location");
                      setState(() {
                        data = {
                          "time": result["time"],
                          "location": result["location"],
                          "flag": result["flag"],
                          "isDay": result["isDay"],
                          "date": result["date"]
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location, color: Colors.white,),
                    label: Text(
                        "Edit location",
                      style: TextStyle(
                        color: Colors.white
                      )
                    ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(flagImage),
                    ),
                    SizedBox(width: 10),
                    Text(
                      data["location"],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        letterSpacing: 2,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data["time"],
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                Text(
                  data["date"],
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

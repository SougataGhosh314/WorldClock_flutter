import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    print(data["isDay"]);

    //set backgroud
    String bgImage = data["isDay"] ? "day.jpg" : "night.png";
    Color bgColor = data["isDay"] ? Colors.blue[800] : Colors.black45;

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
                    onPressed: (){
                      Navigator.pushNamed(context, "/choose_location");
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
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

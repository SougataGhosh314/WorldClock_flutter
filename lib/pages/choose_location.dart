import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;
  
  void getData() async {
    // simulating network request for a username
    String username = await Future.delayed(Duration(seconds: 3), () {
      return "Jaime";
    });

    // simulating network request to do something with the username
    String rank = await Future.delayed(Duration(seconds: 2), () {
      return "Knight and Lord Commander of the Kingsguard";
    });

    print("$username: $rank");
  }

  @override
  void initState() {
    // implement initState
    super.initState();
    print("init state function ran");

    getData();
    print("Hi");
  }

  @override
  Widget build(BuildContext context) {
    print("build state function ran");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Choose Loaction"),
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(
        onPressed: (){
          setState(() {
            counter++;
          });
        },
        child: Text("Reset state: $counter"),
      ),
    );
  }


}

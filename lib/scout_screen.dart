import 'package:flutter/material.dart';

class ScoutScreen extends StatefulWidget {
  @override
  ScoutScreenState createState() {
    return ScoutScreenState();
  }
}

class ScoutScreenState extends State<ScoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Team Number",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Match Number",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Submit"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green[700]),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatefulWidget {
  @override
  _AppStateState createState() => _AppStateState();
}

class _AppStateState extends State<AppState> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.green,
          accentColor: Colors.greenAccent,
          inputDecorationTheme: InputDecorationTheme(
              fillColor: Colors.green, focusColor: Colors.green)),
      home: Scaffold(
        appBar: AppBar(
            title: Text("Justin's Mini App"),
            backgroundColor: Colors.green[900]),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.show_chart),
              label: "Pre-Event\nAnalysis"),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.remove_red_eye),
              label: "Scouting")
        ], backgroundColor: Colors.green[900]),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Event code",
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
      ),
    );
  }
}

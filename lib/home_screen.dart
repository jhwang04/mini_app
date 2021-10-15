import 'package:flutter/material.dart';
import 'package:mustang_mini_app/pre_event_analysis_screen.dart';
import 'package:mustang_mini_app/scout_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final List children = [
    HomeScreenWidget(),
    ScoutScreen(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Justin's Mini App"), backgroundColor: Colors.green[900]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: this.index,
          onTap: (int index) {
            setState(() => {switchTab(index)});
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.show_chart),
                label: "Pre-Event\nAnalysis"),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.remove_red_eye),
                label: "Scouting")
          ],
          backgroundColor: Colors.green[900]),
      body: children[index],
    );
  }

  void switchTab(int index) {
    this.index = index;
  }
}

class HomeScreenWidget extends StatelessWidget {
  String currentText = "";

  Widget build(BuildContext context) {
    return Column(
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
            onChanged: (String value) => {this.currentText = value},
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PreEventAnalysisPage(currentText)),
            );
          },
          child: Text("Submit"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green[700]),
          ),
        ),
      ],
    );
  }
}

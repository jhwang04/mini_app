import 'package:flutter/material.dart';

class PreEventAnalysisPage extends StatelessWidget {
  String titleText = "";

  PreEventAnalysisPage(String titleText) {
    this.titleText = titleText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(titleText), backgroundColor: Colors.green[900]),
      body: ListView(
        children: [
          AnalysisListItem("FRC", 3.14159),
          AnalysisListItem("Team 670", 1.2345)
        ],
      ),
    );
  }
}

class AnalysisListItem extends StatelessWidget {
  double? value;
  String? name;

  AnalysisListItem(String name, double value) {
    this.name = name;
    this.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name!,
              style: TextStyle(fontSize: 24),
            ),
            Text(value.toString()),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mustang_mini_app/pre_event_analysis_screen.dart';
import 'package:mustang_mini_app/home_screen.dart';

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
      home: HomeScreen(),
    );
  }
}

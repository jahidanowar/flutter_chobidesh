import 'package:chobidesh/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ChobiDesh",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: "AdventPro",
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "ChobiDesh".toUpperCase(),
            style: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: HomeScreeen(),
      ),
    );
  }
}

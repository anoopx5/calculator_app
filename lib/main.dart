import 'package:calculator_app/mainpage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      home: MainPage(),
    );
  }
}

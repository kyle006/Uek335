import 'package:bmi_calc/screens/input_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalcApp());
}

class BMICalcApp extends StatelessWidget {
  const BMICalcApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
      home: const InputScreen(),
    );
  }
}
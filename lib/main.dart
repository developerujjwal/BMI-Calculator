import 'package:flutter/material.dart';
import 'inputpage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const BMI());
}

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF1D1F33),
          scaffoldBackgroundColor: Color(0xFF0A0D22),appBarTheme: AppBarTheme(backgroundColor: Color(0xFF1D1F33))),
      home: calculator(),
    );
  }
}

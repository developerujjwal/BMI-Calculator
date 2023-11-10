import 'package:bmi_calcutor/inputpage.dart';
import 'package:flutter/material.dart';
import 'calculator_brain.dart';

class result extends StatelessWidget {
  result({
    required this.bmiresult,
    required this.massageinfo,
    required this.resultcal,
  });
  final String bmiresult;
  final String resultcal;
  final String massageinfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            bmiresult,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 600,
            margin: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: inactivecolor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '$bmiresult',
                  style: TextStyle(color: Colors.green, fontSize: 30),
                ),
                Text(
                  resultcal,
                  style: TextStyle(fontSize: 60),
                ),
                Text(
                  massageinfo,
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 100,
              child: Center(
                  child: Text(
                'Re-Calculate',
                style: TextStyle(fontSize: 40),
              )),
              color: Colors.pink,
            ),
          )
        ],
      ),
    );
  }
}

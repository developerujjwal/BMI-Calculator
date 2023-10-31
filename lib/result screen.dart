import 'package:bmi_calcutor/inputpage.dart';
import 'package:flutter/material.dart';

class result extends StatefulWidget {
  const result({super.key});

  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('BMI CALCULATOR'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Your Result',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Container(height: 600,margin:EdgeInsets.only(left: 15,right: 15),decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),color:inactivecolor,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'overweight',
                  style: TextStyle(color: Colors.green, fontSize: 30),
                ),
                Text(
                  '24.5',
                  style: TextStyle(fontSize: 150),
                ),
                Text('your bmi is not correct',style: TextStyle(fontSize: 30),)
              ],
            ),
          ),
          Container(height: 100,
            child: Center(
                child: Text(
              'Re-Calculate',
              style: TextStyle(fontSize: 40),
            )),
            color: Colors.pink,
          )
        ],
      ),
    );
  }
}

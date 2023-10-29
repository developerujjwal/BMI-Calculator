import 'package:bmi_calcutor/inputpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

int height = 180;

enum gender {
  male,
  female,
}

const inactivecolor = Color(0xFF1D1F33);
const activecolor = Color(0xFF151228);

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _BMIState();
}

class _BMIState extends State<calculator> {
  Color malecard = inactivecolor;
  Color femalecard = inactivecolor;
  void ujj(gender pre) {
    if (pre == gender.male) {
      /*if (malecard == inactivecolor) {
        malecard = activecolor;
        femalecard=inactivecolor;
      } else {
        malecard = inactivecolor;
      }*/
      (malecard == inactivecolor)
          ? (malecard = activecolor, femalecard = inactivecolor)
          : malecard = inactivecolor;
    } else if (pre == gender.female) {
      /* if (femalecard == inactivecolor) {
        femalecard = activecolor;
        malecard=inactivecolor;
      } else {
        femalecard = inactivecolor;
      }*/
      (femalecard == inactivecolor)
          ? (femalecard = activecolor, malecard = inactivecolor)
          : femalecard = inactivecolor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  print('male card was pressed');
                  setState(() {
                    ujj(gender.male);
                  });
                },
                child: box(
                    Icon(
                      FontAwesomeIcons.mars,
                      size: 150,
                    ),
                    'MALE',
                    malecard,
                    SizedBox()),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  print('female card was pressed');
                  setState(() {
                    ujj(gender.female);
                  });
                },
                child: box(
                    Icon(
                      FontAwesomeIcons.venus,
                      size: 150,
                    ),
                    'FEMALE',
                    femalecard,
                    SizedBox()),
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: box(
                  Icon(FontAwesomeIcons.mars),
                  'HEIGHT        $height',
                  inactivecolor,
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      max: 220,
                      min: 120,
                      inactiveColor: Colors.white,
                      activeColor: Colors.pink,
                      onChanged: (value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: box(Icon(FontAwesomeIcons.mars), 'jgbj', inactivecolor,
                      SizedBox())),
              Expanded(
                  child: box(Icon(FontAwesomeIcons.mars), 'ukjhcdb',
                      inactivecolor, SizedBox())),
            ],
          ),
        ],
      ),
    );
  }
}

class box extends StatelessWidget {
  box(this.tag, this.write, this.rang, this.wid);
  final Icon tag;
  final String write;
  final Color rang;
  final Widget wid;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 100,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: rang,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          tag,
          Text(
            write,
            style: TextStyle(fontSize: 30),
          ),
          wid
        ],
      ),
    );
  }
}

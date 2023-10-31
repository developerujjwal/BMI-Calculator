import 'package:bmi_calcutor/inputpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta/meta.dart';
import 'result screen.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    tag: Icon(
                      FontAwesomeIcons.mars,
                      size: 100,
                    ),
                    write: 'MALE',
                    rang: malecard),
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
                  tag: Icon(
                    FontAwesomeIcons.venus,
                    size: 100,
                  ),
                  write: 'FEMALE',
                  rang: femalecard,
                ),
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: box(
                  write: 'HEIGHT        $height',
                  rang: inactivecolor,
                  wid: SliderTheme(
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
                child: box(
                    write: 'WEIGHT',
                    rang: inactivecolor,
                    buton: btn(
                      icon: FontAwesomeIcons.plus,
                      hit: 56,
                      wdh: 56,
                      s: 30,
                    ),
                    buton1: btn(
                      icon: FontAwesomeIcons.minus,
                      hit: 56,
                      wdh: 56,
                      s: 30,
                    )),
              ),
              Expanded(
                child: box(
                  write: 'HEIGHT',
                  rang: inactivecolor,
                  buton: btn(
                    icon: FontAwesomeIcons.plus,
                    hit: 56,
                    wdh: 56,
                    s: 30,
                  ),
                  buton1: btn(
                    icon: FontAwesomeIcons.minus,
                    hit: 56,
                    wdh: 56,
                    s: 30,
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => result()));
            },
            child: Container(
              color: Colors.pink,
              height: 100,
              child: Center(
                child: Text(
                  'CALCULATOR',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class box extends StatelessWidget {
  //box(this.tag, this.write, this.rang, this.wid,btn,);
  const box(
      {required this.write,
      this.tag = const Icon(
        Icons.mic_none_sharp,
        size: 0,
      ),
      this.rang = Colors.transparent,
      this.wid = const SizedBox(
        height: 2,
      ),
      this.buton = const btn(
        icon: FontAwesomeIcons.plus,
        hit: 0,
        wdh: 0,
        s: 0,
      ),
      this.buton1 = const btn(
        icon: FontAwesomeIcons.plus,
        hit: 0,
        wdh: 0,
        s: 0,
      )});

  final Icon tag;
  final String write;
  final Color rang;
  final Widget wid;
  final btn buton;
  final btn buton1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
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
          wid,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [buton, buton1],
          ),
        ],
      ),
    );
  }
}

class btn extends StatelessWidget {
  const btn(
      {required this.icon,
      required this.hit,
      required this.wdh,
      required this.s});
  final IconData? icon;
  final double hit;
  final double wdh;
  final double s;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(height: hit, width: wdh),
      elevation: 6.0,
      child: Icon(
        icon,
        size: s,
      ),
    );
  }
}

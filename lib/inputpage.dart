import 'package:bmi_calcutor/inputpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta/meta.dart';
import 'result screen.dart';
import 'calculator_brain.dart';
int weight = 100;
int height = 180;
int age =22;

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
                      size: 80,
                    ),
                    write: Text('MALE'),
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
                    size: 80,
                  ),
                  write: Text('FEMALE'),
                  rang: femalecard,
                ),
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: box(
                  write: Text('HEIGHT'), mc: Text('cm'),hei: Text('$height',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold)),
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
                    write: Text('WEIGHT'),
                    rang: inactivecolor,
                    buton: btn(
                      check_icon: 1,
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
                      check_icon: 0,
                    ),wei: Text(weight.toString(),style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold))),
              ),
              Expanded(
                child: box(
                  write: Text('AGE'),
                  rang: inactivecolor,
                  buton: btn(
                    icon: FontAwesomeIcons.plus,
                    hit: 56,
                    wdh: 56,
                    s: 30,
                    check_icon: 11,
                  ),
                  buton1: btn(
                    icon: FontAwesomeIcons.minus,
                    hit: 56,
                    wdh: 56,
                    s: 30,
                    check_icon:00 ,
                  ),
                  ega: Text(age.toString(),style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              calculatorbrain cal=calculatorbrain(height:height,weight:weight);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => result(
                bmiresult: cal.brain(),
                massageinfo: cal.message_(),
                resultcal: cal.result_(),
              )));
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
        check_icon: 55,
      ),
      this.buton1 = const btn(
        icon: FontAwesomeIcons.plus,
        hit: 0,
        wdh: 0,
        s: 0,
        check_icon: 55,
      ),
      this.ega = const Text('  '),
      this.wei = const Text(' '),
      this.hei = const Text(' '),
      this.mc = const Text(' ')});

  final Icon tag;
  final Widget write;
  final Color rang;
  final Widget wid;
  final btn buton;
  final btn buton1;
  final Widget wei;
  final Widget ega;
  final Widget hei;
  final Widget mc;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 100,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: rang,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          tag,
         write,
          Row(children: [hei,mc]),wei,ega,
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
      required this.s,
      required this.check_icon,});
  final IconData? icon;
  final double hit;
  final double wdh;
  final double s;
  final int check_icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        if (check_icon==0){
          weight--;
        }
        else if (check_icon==1){
          weight++;
        }
      else if (check_icon==00){
        age--;
        }
      else if (check_icon==11){
        age++;
        }
        }
      ,
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

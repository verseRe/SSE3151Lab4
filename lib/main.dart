import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'YeaYeah',
        home: Scaffold(
            appBar: AppBar(
              title: Text('< Dice Roller >',
              style: TextStyle(
                fontFamily: 'CustomFnts',
                fontSize: 30,
                color: Colors.yellow.shade600,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.brown.shade900,
            ),
            body: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/bg/newbackground@3x.png"),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 40, bottom: 40),
                        child: Image.asset("assets/bg/diceeLogo.png"),
                      ),
                      Dice(),
                    ],
                  )
                ),
            ),
        ),
    );
  }
}

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  final sounds = AudioCache(prefix: "assets/sounds/",);
  int dice1_no = 6;
  int dice2_no = 6;
  void update() {
    setState(() {
      dice1_no = Random().nextInt(6) + 1;
      dice2_no = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 25, bottom: 150),
                    child: Image.asset("assets/dice/dice$dice1_no.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25, bottom:150),
                    child: Image.asset("assets/dice/dice$dice2_no.png"),
                  ),
                  ],
                ),
              FlatButton(
                color: Colors.brown.shade900,
                minWidth: 100,
                child: Text(
                  'Roll Dem Dice!',
                  style: TextStyle(
                    color: Colors.white,
                  )
                ),
                onPressed: () {
                  update();
                  sounds.play('DiceSE.mp3');
                }
              )
              ],
            ),
          ),
        ),
      );
  }
}

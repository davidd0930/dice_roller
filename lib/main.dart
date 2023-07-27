import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(DiceApp());

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int diceNumber = 1;

  void rollDice() {
    var random = new Random();
    for (var i = 0; i < 10; i++) {
      Future.delayed(Duration(milliseconds: 100 * i), () {
        setState(() {
          diceNumber = random.nextInt(6) + 1;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/dice$diceNumber.png'),
            SizedBox(height: 50),
            ElevatedButton(
              child: Text('Roll'),
              onPressed: rollDice,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:conserve/extra_widgets/score_calculator.dart';
import 'package:conserve/quiz.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(Conserve());
} 

class Conserve extends StatefulWidget {
  void changeScore(int score) {
    _ConserveState.score += score;
  } 

  @override
  _ConserveState createState() => _ConserveState();
}

class _ConserveState extends State<Conserve> {

  static int score = 0;

  ScoreCalculator s = ScoreCalculator();
  





  @override
  Widget build(BuildContext context) {
    //s.calcCar();
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        
      ),
      home: Home(score),
    );
  }
}



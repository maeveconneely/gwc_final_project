import 'package:conserve/quiz.dart';
import 'package:flutter/material.dart';

void main() => runApp(Conserve());

class Conserve extends StatefulWidget {

  void changeScore(int score) {
    _ConserveState.score += score;
  } 

  @override
  _ConserveState createState() => _ConserveState();
}

class _ConserveState extends State<Conserve> {

  static int score = 0;




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Quiz(score),
    );
  }
}

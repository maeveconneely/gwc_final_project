import 'package:conserve/extra_widgets/score_calculator.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
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
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: SplashScreen(
        seconds: 2,
        navigateAfterSeconds: Home(score),
        image: Image.asset(
          'images/conserv.png',
          alignment: Alignment.bottomCenter,
        ),
        backgroundColor: Colors.cyan,
        photoSize: 100.0,
      ),
    );
  }
}

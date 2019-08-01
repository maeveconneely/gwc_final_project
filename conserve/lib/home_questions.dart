import 'package:flutter/material.dart';
import './num.dart';

class HomeQuestions extends StatelessWidget {
  int score;

  HomeQuestions(this.score);

  void _updateScore(String value) {
    score = int.parse(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: score.toString(),
        ),
        onChanged: (String sValue) {
          print(sValue);
          if (Num.isNumeric(sValue)) {
            score = int.parse(sValue);
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Text('Make sure it\'s a number!'),
                  );
                });
          }
        },
      ),
    );
  }
}

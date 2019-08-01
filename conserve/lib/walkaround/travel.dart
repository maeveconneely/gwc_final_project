import 'package:conserve/pages/travel_questions.dart';
import 'package:flutter/material.dart';

class Travel extends StatelessWidget {
  final int miles;
  
  Travel(this.miles);

  @override
  Widget build(BuildContext context) {
    print(miles);
    return Container(
      child: TravelQuestions(miles),
      
    );
  }
}
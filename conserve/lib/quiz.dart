import 'package:conserve/home_questions.dart';
import 'package:conserve/travel.dart';
import 'package:conserve/travel_questions.dart';
import 'package:flutter/material.dart';
import './food.dart';

class Quiz extends StatefulWidget {
  int score;
  int miles;

  Quiz(this.score);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  static int score = 0;
  static int miles = 0;

  @override
  void initState() {
    score = widget.score;
    miles = widget.miles;
    super.initState();
  }

  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeQuestions(score),
    Food(),
    Travel(miles),
    Text('Index 3, Misc.')
  ];

  void _onItemTapped(int index) {

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Footprint Test'),
      ),
      body: Container(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            title: Text('Food'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            title: Text('Travel'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Misc'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

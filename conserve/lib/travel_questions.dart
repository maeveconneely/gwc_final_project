import 'package:conserve/drop_field.dart';
import 'package:conserve/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './num.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class TravelQuestions extends StatefulWidget {
  int score;
  int miles;

  TravelQuestions(this.miles);

  @override
  _TravelQuestionsState createState() => _TravelQuestionsState();
}

class _TravelQuestionsState extends State<TravelQuestions> {
  static int miles;
  final String nameKey = '_miles';

  @override
  void initState() {
    //score = widget.score;
    miles = widget.miles;
    super.initState();
  }

  void _changeMenu(String value) {
    setState(() {
      dropdownValue = value;
    });
  }

  void _onChange(value) {
    print(value);
    if (Num.isNumeric(value)) {
      miles = int.parse(value);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Make sure it\'s a number!'),
            );
          });
    }
  }

  void saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print('saved');
    await preferences.setString(nameKey, miles.toString());
  }

  Future<int> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String milesNum = preferences.getString(nameKey);
    print(milesNum);

    if (milesNum == null) {
      return 0;
    }

    return int.parse(milesNum);
  }

  static int score;

  static const List<String> itemsBar = [
    'Pick Transportation',
    'Car',
    'Bus',
  ];

  String dropdownValue = itemsBar[0];

  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            DropDown(itemsBar, _changeMenu, dropdownValue, 'Select Travel'),
            DropField('Enter Amount', _onChange),
          ],
        ),
      ),
    );
  }
}

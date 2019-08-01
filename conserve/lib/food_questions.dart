import 'package:conserve/drop_field.dart';
import 'package:conserve/dropdown.dart';
import 'package:flutter/material.dart';
import './num.dart';

class FoodQuestions extends StatefulWidget {
  @override
  _FoodQuestionsState createState() => _FoodQuestionsState();
}

class _FoodQuestionsState extends State<FoodQuestions> {
  static const List<String> itemsBar = [
    'Pick Diet',
    'Omnivore',
    'Vegan',
    'Vegetarian',
    'Meat Eater',
  ];

  void _changeMenu(String value) {
    setState(() {
      dropdownValue = value;
      print(value);
    });
  }

  void _onChange(value) {
    print(value);
    if (Num.isNumeric(value)) {
      //miles = int.parse(sValue);
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

  String dropdownValue = itemsBar[0];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            DropDown(itemsBar, _changeMenu, dropdownValue, 'Select Diet'),
            DropField('Enter lbs', _onChange),
          ],
        ),
      ),
    );
  }
}

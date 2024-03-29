import 'package:conserve/data/database_helper.dart';
import 'package:conserve/extra_widgets/drop_field.dart';
import 'package:conserve/extra_widgets/dropdown.dart';
import 'package:conserve/extra_widgets/num.dart';
import 'package:conserve/model/score.dart';
import 'package:flutter/material.dart';

class FoodQuestions extends StatefulWidget {
  static const List<String> itemsBar = [
    'Pick Item',
    'Beef/Lamb',
    'Pork',
    'Poultry',
    'Cheese',
    'Milk',
    'Eggs',
    'Rice',
    'Bread/Cereals',
    'Legumes',
    'Vegetables',
    'Fruit',
    'Carrots',
    'Potatoes',
  ];

  @override
  _FoodQuestionsState createState() => _FoodQuestionsState();
}

class _FoodQuestionsState extends State<FoodQuestions> {
  int column;
  String nameKey;
  var dbHelper = DatabaseHelper.instance;

  void _onChange(value) {
    if (Num.isNumeric(value)) {
      _changeScore(int.parse(value));
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

  void _changeMenu(String value) {
    setState(() {
      dropdownValue = value;
      nameKey = dropdownValue;
    });
  }

  void _changeScore(int value) async {
    bool go = false;
    List it = FoodQuestions.itemsBar;
    if (nameKey == it[1]) {
      column = 3;
      go = true;
    } else if (nameKey == it[2]) {
      column = 4;
      go = true;
    } else if (nameKey == it[3]) {
      column = 5;
      go = true;
    } else if (nameKey == it[4]) {
      column = 6;
      go = true;
    } else if (nameKey == it[5]) {
      column = 7;
      go = true;
    } else if (nameKey == it[6]) {
      column = 8;
      go = true;
    } else if (nameKey == it[7]) {
      column = 9;
      go = true;
    } else if (nameKey == it[8]) {
      column = 10;
      go = true;
    } else if (nameKey == it[9]) {
      column = 11;
      go = true;
    } else if (nameKey == it[10]) {
      column = 12;
      go = true;
    } else if (nameKey == it[11]) {
      column = 13;
      go = true;
    } else if (nameKey == it[12]) {
      column = 14;
      go = true;
    } else if (nameKey == it[13]) {
      column = 15;
      go = true;
    }

    Score row =
        Score(columnId: column, columnName: nameKey, columnScore: value);

    if (go) {
      await dbHelper.insertScore(row).then((value) {
      }).catchError((onError) {
        dbHelper.updateScore(row);
      });
    }
  }

  _queryScores() async {
    final allRows = await dbHelper.queryAllRows();
    return await allRows[0]['score'];
  }

  String dropdownValue = FoodQuestions.itemsBar[0];
  @override
  Widget build(BuildContext context) {
    _queryScores();
    return Container(
      child: Card(
        child: Column(
          children: [
            DropDown(FoodQuestions.itemsBar, _changeMenu, dropdownValue,
                'Select Diet'),
            DropField(
                text: 'Enter serving',
                f: _onChange,
                dropdownValue: dropdownValue),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '\n\n\n\n“Save the Earth, it’s our only source of chocolate!”',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '\n-Anonymous',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

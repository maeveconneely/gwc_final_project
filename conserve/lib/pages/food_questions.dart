import 'package:conserve/data/database_helper.dart';
import 'package:conserve/extra_widgets/drop_field.dart';
import 'package:conserve/extra_widgets/dropdown.dart';
import 'package:conserve/extra_widgets/num.dart';
import 'package:conserve/model/score.dart';
import 'package:flutter/material.dart';

class FoodQuestions extends StatefulWidget {
  @override
  _FoodQuestionsState createState() => _FoodQuestionsState();
}

class _FoodQuestionsState extends State<FoodQuestions> {
  int column;
  String nameKey;
  var dbHelper = DatabaseHelper.instance;

  static const List<String> itemsBar = [
    'Pick Diet',
    'Meat',
    'Vegetables'
    ''
    ,
  ];

  void _onChange(value) {
    print(value);
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
    if (nameKey == 'Meat') {
      column = 2;
      go = true;
    } else if (nameKey == 'Vegetables') {
      column = 3;
      go = true;
    }

    Score row = Score(
      columnId: column,
      columnName: nameKey,
      columnScore: value
    );

    if (go) {
      await dbHelper.insertScore(row).then((value) {
        print(value);
      }).catchError((onError) {
        dbHelper.updateScore(row);
      });
    }
  }

  _queryScores() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
    return await allRows[0]['score'];
  }

  String dropdownValue = itemsBar[0];
  @override
  Widget build(BuildContext context) {
    _queryScores();
    return Container(
      child: Card(
        child: Column(
          children: [
            DropDown(itemsBar, _changeMenu, dropdownValue, 'Select Diet'),
            DropField(
              'Enter lbs',
              _onChange,
            ),
          ],
        ),
      ),
    );
  }
}

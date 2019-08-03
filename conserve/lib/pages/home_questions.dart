import 'package:conserve/data/database_helper.dart';
import 'package:conserve/extra_widgets/drop_field.dart';
import 'package:conserve/extra_widgets/dropdown.dart';
import 'package:conserve/extra_widgets/num.dart';
import 'package:conserve/model/score.dart';
import 'package:flutter/material.dart';

class HomeQuestions extends StatefulWidget {
  static const List<String> itemBar = [
    'Pick Applicance',
    'Smart Phone',
    'Tablet',
    'Shower',
    'Bathroom',
    'Water Bottles'
  ];

  @override
  _HomeQuestionsState createState() => _HomeQuestionsState();
}

class _HomeQuestionsState extends State<HomeQuestions> {
  int column;
  String nameKey;
  var dbHelper = DatabaseHelper.instance;

  void _changeMenu(String value) {
    setState(() {
      dropdownValue = value;
      nameKey = dropdownValue;
    });
  }

  void _changeScore(int value) async {
    bool go = false;
    if (nameKey == 'Smart Phone') {
      column = 16;
      go = true;
    } else if (nameKey == 'Tablet') {
      column = 17;
      go = true;
    } else if (nameKey == 'Shower') {
      column = 18;
      go = true;
    } else if (nameKey == 'Bathroom') {
      column = 19;
      go = true;
    } else if (nameKey == 'Water Bottles') {
      column = 20;
      go = true;
    }

    Score row =
        Score(columnId: column, columnName: nameKey, columnScore: value);

    //DatabaseHelper.columnId = row.id;

    if (go) {
      print('okay');
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

  static int score;

  String dropdownValue = HomeQuestions.itemBar[0];

  Widget build(BuildContext context) {
    _queryScores();
    return Container(
      child: Card(
        child: Column(
          children: [
            DropDown(HomeQuestions.itemBar, _changeMenu, dropdownValue,
                '  Select Appliance'),
            DropField(
                f: _onChange,
                dropdownValue: dropdownValue),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '\n\n\n\n"What is the use of a house if you haven\'t got a tolerable planet to put it on?"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '\n-Henry David Thoreau',
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

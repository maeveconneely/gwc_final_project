import 'package:conserve/data/database_helper.dart';
import 'package:conserve/extra_widgets/drop_field.dart';
import 'package:conserve/extra_widgets/dropdown.dart';
import 'package:conserve/extra_widgets/num.dart';
import 'package:conserve/model/score.dart';
import 'package:flutter/material.dart';


class MiscQuestions extends StatefulWidget {
  static const List<String> itemBar = [
    'Pick Item',
    'Clothes',
  ];

  @override
  _MiscQuestionsState createState() => _MiscQuestionsState();
}

class _MiscQuestionsState extends State<MiscQuestions> {
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
    if (nameKey == 'Clothes') {
      column = 21;
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

  String dropdownValue = MiscQuestions.itemBar[0];

  Widget build(BuildContext context) {
    _queryScores();
    return Container(
      child: Card(
        child: Column(
          children: [
            DropDown(MiscQuestions.itemBar, _changeMenu, dropdownValue,
                '  Select Appliance'),
            DropField(
                f: _onChange,
                dropdownValue: dropdownValue),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '\n\n\n\n“Be the change you wish to see in this world.”',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '\n-Mahatma Gandhi',
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
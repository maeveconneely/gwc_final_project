import 'package:conserve/data/database_helper.dart';
import 'package:conserve/extra_widgets/drop_field.dart';
import 'package:conserve/extra_widgets/dropdown.dart';
import 'package:conserve/extra_widgets/num.dart';
import 'package:conserve/model/score.dart';
import 'package:flutter/material.dart';

class TravelQuestions extends StatefulWidget {
  int score;
  int miles;

  TravelQuestions(this.miles);

  @override
  _TravelQuestionsState createState() => _TravelQuestionsState();
}

class _TravelQuestionsState extends State<TravelQuestions> {
  static int miles;
  int column;
  String nameKey;
  var dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    //score = widget.score;
    miles = widget.miles;
    super.initState();
  }

  void _changeMenu(String value) {
    setState(() {
      dropdownValue = value;
      nameKey = dropdownValue;
    });
  }

  void _changeScore(int value) async {
    bool go = false;
    if (nameKey == 'Car') {
      column = 0;
      go = true;
    } else if (nameKey == 'Bus') {
      column = 1;
      go = true;
    }

    Score row = Score(
      columnId: column,
      columnName: nameKey,
      columnScore: value
    );

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

  static const List<String> itemsBar = [
    'Pick Transportation',
    'Car',
    'Bus',
  ];

  String dropdownValue = itemsBar[0];

  Widget build(BuildContext context) {
    _queryScores();
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

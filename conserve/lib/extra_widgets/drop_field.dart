import 'package:conserve/pages/food_questions.dart';
import 'package:conserve/pages/home_questions.dart';
import 'package:conserve/pages/misc_questions.dart';
import 'package:flutter/material.dart';

class DropField extends StatelessWidget {
  final String text;
  final Function f;
  final String dropdownValue;
  final String hintText = '';
  

  DropField({this.text = '', this.f, this.dropdownValue});

  String makeHintText() {
    List it = FoodQuestions.itemsBar;
    if (it.contains(dropdownValue)) {
      if (dropdownValue == it[1]) {
        return hintText + ' 3-4 oz per Serving';
      } else if (dropdownValue == it[2]) {
        return hintText + ' 3-4 oz per Serving';
      } else if (dropdownValue == it[3]) {
        return hintText + ' 3-4 oz per Serving';
      } else if (dropdownValue == it[4]) {
        return hintText + ' 1.5 oz (3-4 dice) per Serving';
      } else if (dropdownValue == it[5]) {
        return hintText + ' 1 cup per Serving';
      } else if (dropdownValue == it[6]) {
        return hintText + ' 1 egg per Serving';
      } else if (dropdownValue == it[7]) {
        return hintText + ' 1/2 cup per Serving';
      } else if (dropdownValue == it[8]) {
        return hintText + ' 1 slice of bread  or 1 cup of cereal per Serving';
      } else if (dropdownValue == it[9]) {
        return hintText + ' 1/2 cup per Serving';
      } else if (dropdownValue == it[10]) {
        return hintText + ' 1 cup per Serving';
      } else if (dropdownValue == it[11]) {
        return hintText + ' 1 cup of juice or 1 cup fresh or 1/2 cup dried per Serving';
      } else if (dropdownValue == it[12]) {
        return hintText + ' 1 cup per Serving';
      } else if (dropdownValue == it[13]) {
        return hintText + ' 1 cup per Serving';
      }
    }
    return hintText;
  }

  String makeLabelText() {
    List<String> it = HomeQuestions.itemBar;
    List<String> ite = MiscQuestions.itemBar;
    if (it.contains(dropdownValue)) {
      if (dropdownValue == it[1]|| dropdownValue == it[2]) {
        return text + 'Enter Years Owned';
      } else if (dropdownValue == it[3]) {
        return text + 'Enter Showering Time (minutes)';
      } else if (dropdownValue == it[4]) {
        return text + 'Enter Amount of Times Gone to the Bathroom';
      } else if (dropdownValue == it[5]) {
        return text + 'Enter Amount of Plastic Water Bottles used';
      }
    } else if (ite.contains(dropdownValue)) {
      if (dropdownValue == ite[1]) {
        return text + 'Enter # of clothes bought today';
      }
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(15),
          labelText: makeLabelText(),
          hintText: makeHintText(),
        ),
        onChanged: (String value) {
          f(value);
        },
      ),
    );
  }
}

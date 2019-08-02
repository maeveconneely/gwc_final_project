import 'package:conserve/pages/food_questions.dart';
import 'package:flutter/material.dart';

class DropField extends StatelessWidget {
  String text;
  Function f;
  String dropdownValue;
  String hintText = '';

  DropField(this.text, this.f, this.dropdownValue);

  String makeHintText() {
    List it = FoodQuestions.itemsBar;
    if (it.contains(dropdownValue)) {
      if (dropdownValue == it[1]) {
        return hintText + ' 6.61 lbs per Serving';
      } else if (dropdownValue == it[2]) {
        return hintText + ' 1.72 lbs per Serving';
      } else if (dropdownValue == it[3]) {
        return hintText + ' 1.26 lbs per Serving';
      } else if (dropdownValue == it[4]) {
        return hintText + ' 2.45 lbs per Serving';
      } else if (dropdownValue == it[5]) {
        return hintText + ' .72 lbs per Serving';
      } else if (dropdownValue == it[6]) {
        return hintText + ' .89 lbs per Serving';
      } else if (dropdownValue == it[7]) {
        return hintText + ' .16 lbs per Serving';
      } else if (dropdownValue == it[9]) {
        return hintText + ' .11 lbs per Serving';
      } else if (dropdownValue == it[12]) {
        return hintText + ' .07 lbs per Serving';
      } else if (dropdownValue == it[13]) {
        return hintText + ' .03 lbs per Serving';
      }
    }
    return hintText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(15),
          labelText: text,
          hintText: makeHintText(),
        ),
        onChanged: (String value) {
          f(value);
        },
      ),
    );
  }
}

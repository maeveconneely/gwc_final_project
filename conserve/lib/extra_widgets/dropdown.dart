import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {

  List<String> itemsBar;
  String dropdownValue;
  Function f;
  String text;

  DropDown(this.itemsBar, this.f, this.dropdownValue, this.text);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DropdownButton<String>(
          value: dropdownValue,
          onChanged: (String newValue) {
            f(newValue);
          },
          items: itemsBar.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Text(text),
      ],
    );
  }
}

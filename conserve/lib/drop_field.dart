import 'package:flutter/material.dart';

class DropField extends StatelessWidget {
  String text;
  Function f;

  DropField(this.text, this.f);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(15),
          labelText: text,
          //hintText: 'p',
        ),
        onChanged: (String value) {
          f(value);
        },
      ),
    );
  }
}

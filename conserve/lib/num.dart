import 'package:flutter/material.dart';

class Num {
  static bool isNumeric(String s) {
    if (s == null || s == '') {
      return true;
    }
    return double.parse(s, (e) => null) != null;
  }


}

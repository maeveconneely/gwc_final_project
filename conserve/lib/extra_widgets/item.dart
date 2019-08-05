import 'package:flutter/material.dart';

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  FutureBuilder<String> expandedValue;
  String headerValue;
  bool isExpanded;
}
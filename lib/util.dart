import 'dart:math';

import 'package:flutter/material.dart';

final colorList = [
  Colors.indigo,
  Colors.indigo,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.black,
  Colors.orange,
  Colors.teal,
  Colors.blueGrey,
  Colors.indigo,
  Colors.indigo,
  Colors.indigo,
  Colors.grey,
  Colors.amber
];
Color getRandomColor() {
  final index = Random().nextInt(colorList.length);
  final randomColor = colorList[index];
  return randomColor;
}

void showSuccess(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg),backgroundColor: Colors.green));
}
void showError(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg),backgroundColor: Colors.red));
}
import 'package:flutter/material.dart';

void showSnack(BuildContext context, String msg, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.white,
    content: Text(
      msg,
      style: TextStyle(
          color: color, fontFamily: 'Ubuntu', fontWeight: FontWeight.bold),
    ),
  ));
}

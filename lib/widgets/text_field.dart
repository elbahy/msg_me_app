import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({required this.text, required this.onChanged, super.key});

  TextStyle txtStyle =
      TextStyle(color: Colors.white70, fontSize: 18, fontFamily: 'Ubuntu');

  String? text;

  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: txtStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 25),
          labelText: text,
          labelStyle: txtStyle,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(50)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(50))),
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({required this.text, super.key});

  TextStyle txtStyle =
      TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Ubuntu');

  String? text;
  @override
  Widget build(BuildContext context) {
    return TextField(
     
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

import 'package:flutter/material.dart';
import 'package:msg_me_app/consts.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.text, super.key});
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Center(
          child: Text(text,
              style: TextStyle(
                  color: primaryColor, fontSize: 18, fontFamily: 'Ubuntu'))),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
    );
  }
}

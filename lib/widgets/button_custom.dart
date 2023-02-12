import 'package:flutter/material.dart';
import 'package:msg_me_app/consts.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.text, required this.onTap, super.key});
  String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        child: Center(
            child: Text(text,
                style: TextStyle(
                    color: primaryColor, fontSize: 18, fontFamily: 'Ubuntu'))),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}

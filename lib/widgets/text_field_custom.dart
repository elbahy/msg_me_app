import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {required this.text,
      required this.onChanged,
      super.key,
      this.obscureText = false});

  TextStyle txtStyle = const TextStyle(
      color: Colors.white70, fontSize: 18, fontFamily: 'Ubuntu');

  String? text;
  bool? obscureText;

  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(50),
    );
    return TextFormField(
      obscureText: obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Required Field';
        }
      },
      onChanged: onChanged,
      style: txtStyle,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 25),
          labelText: text,
          labelStyle: txtStyle,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          errorBorder: outlineInputBorder,
          focusedErrorBorder: outlineInputBorder),
    );
  }
}

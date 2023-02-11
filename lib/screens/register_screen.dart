import 'package:flutter/material.dart';

import '../widgets/button_custom.dart';
import '../widgets/text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static String id = 'RegisterScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child:
            ListView(padding: EdgeInsets.symmetric(horizontal: 18), children: [
          Image.asset(
            'assets/images/signup.png',
            height: 200,
          ),
          Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontFamily: 'Bebas',
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CustomTextField(text: 'Full Name'),
          SizedBox(height: 15),
          CustomTextField(text: 'UserName'),
          SizedBox(height: 15),
          CustomTextField(text: 'PassWord'),
          SizedBox(height: 20),
          CustomButton(text: 'SignUp'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have account? ',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Ubuntu'),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('Login',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Ubuntu'))),
            ],
          )
        ]),
      ),
    );
  }
}

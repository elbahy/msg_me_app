import 'package:flutter/material.dart';
import 'package:msg_me_app/screens/register_screen.dart';
import 'package:msg_me_app/widgets/button_custom.dart';
import 'package:msg_me_app/widgets/text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static String id = 'LoginScreen';
  String? email;
  String? passWord;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child:
            ListView(padding: EdgeInsets.symmetric(horizontal: 18), children: [
          Image.asset(
            'assets/images/login.png',
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
          CustomTextField(
              text: 'E-mail',
              onChanged: (email) {
                email = email;
              }),
          SizedBox(height: 15),
          CustomTextField(
              text: 'PassWord',
              onChanged: (passWord) {
                passWord = passWord;
              }),
          SizedBox(height: 20),
          CustomButton(
            text: 'Login',
            onTap: () {},
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have account? ',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Ubuntu'),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RegisterScreen.id);
                  },
                  child: Text('Register',
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

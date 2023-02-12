import 'package:flutter/material.dart';

import '../widgets/button_custom.dart';
import '../widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  static String id = 'RegisterScreen';
  String? fullName;
  String? passWord;
  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child:
            ListView(padding: EdgeInsets.symmetric(horizontal: 18), children: [
          SizedBox(height: 30),
          Image.asset(
            'assets/images/signup.png',
            height: 130,
          ),
          SizedBox(height: 30),
          Text(
            'register',
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
              text: 'Full Name',
              onChanged: (data) {
                fullName = data;
              }),
          SizedBox(height: 15),
          CustomTextField(
              text: 'E-mail',
              onChanged: (data) {
                email = data;
              }),
          SizedBox(height: 15),
          CustomTextField(
              text: 'PassWord',
              onChanged: (data) {
                passWord = data;
              }),
          SizedBox(height: 20),
          CustomButton(
            text: 'SignUp',
            onTap: () async {
              try {
                await registerUser();
                showSnack(context, 'User Registed', Colors.green);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  showSnack(context, 'Weak Password !!', Colors.red);
                } else if (e.code == 'email-already-in-use') {
                  showSnack(context, 'Email Already Exist', Colors.red);
                }
              } catch (e) {
                showSnack(context, e.toString(), Colors.red);
              }
            },
          ),
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

  void showSnack(BuildContext context, String msg, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          style: TextStyle(
              color: color, fontFamily: 'Ubuntu', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: passWord!);
  }
}

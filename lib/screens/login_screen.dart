import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:msg_me_app/screens/chat.dart';
import 'package:msg_me_app/screens/register_screen.dart';
import 'package:msg_me_app/widgets/button_custom.dart';
import 'package:msg_me_app/widgets/text_field_custom.dart';
import 'package:msg_me_app/helper/snackbar_custom.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? passWord;
  GlobalKey<FormState> fkey = GlobalKey();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        body: SafeArea(
          child: Form(
            key: fkey,
            child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                children: [
                  Image.asset(
                    'assets/images/login.png',
                    height: 200,
                  ),
                  const Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: 'Bebas',
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomFormTextField(
                      text: 'E-mail',
                      onChanged: (data) {
                        email = data;
                      }),
                  const SizedBox(height: 15),
                  CustomFormTextField(
                      obscureText: true,
                      text: 'PassWord',
                      onChanged: (data) {
                        passWord = data;
                      }),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: 'Login',
                    onTap: () async {
                      if (fkey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await loginUser();
                          Navigator.pushNamed(context, ChatScreen.id);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnack(context, 'User Not found', Colors.red);
                          } else if (e.code == 'wrong-password') {
                            showSnack(context, 'Wrong Password', Colors.red);
                          }
                        }
                      }
                      isLoading = false;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
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
                          child: const Text('Register',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Ubuntu'))),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: passWord!,
    );
  }
}

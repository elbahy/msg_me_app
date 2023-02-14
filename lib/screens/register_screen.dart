import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:msg_me_app/helper/snackbar_custom.dart';
import '../widgets/button_custom.dart';
import '../widgets/text_field_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});
  static String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? fullName;
  String? passWord;
  String? email;

  GlobalKey<FormState> fKey = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        body: SafeArea(
          child: Form(
            key: fKey,
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 18),
                children: [
                  const SizedBox(height: 30),
                  Image.asset(
                    'assets/images/signup.png',
                    height: 130,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'register',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: 'Bebas',
                    ),
                  ),
                  const SizedBox(height: 50),
                  CustomFormTextField(
                      text: 'Full Name',
                      onChanged: (data) {
                        fullName = data;
                      }),
                  const SizedBox(height: 15),
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
                    text: 'SignUp',
                    onTap: () async {
                      if (fKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await registerUser();
                          showSnack(context, 'User Registed', Colors.green);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnack(context, 'Weak Password !!', Colors.red);
                          } else if (e.code == 'email-already-in-use') {
                            showSnack(
                                context, 'Email Already Exist', Colors.red);
                          }
                        } catch (e) {
                          showSnack(context, e.toString(), Colors.red);
                        }
                        isLoading = false;
                        setState(() {});
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
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
                          child: const Text('Login',
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

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: passWord!);
  }
}

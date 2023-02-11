import 'package:flutter/material.dart';
import 'package:msg_me_app/screens/login_screen.dart';
import 'package:msg_me_app/screens/register_screen.dart';

void main() {
  runApp(const MsgMeApp());
}

class MsgMeApp extends StatelessWidget {
  const MsgMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: ((context) => RegisterScreen())
      },
      initialRoute: LoginScreen.id,
    );
  }
}

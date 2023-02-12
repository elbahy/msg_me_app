import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:msg_me_app/screens/login_screen.dart';
import 'package:msg_me_app/screens/register_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

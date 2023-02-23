import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:msg_me_app/consts.dart';

import '../widgets/chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  static String id = 'ChaTScreen';
  TextEditingController controller = TextEditingController();
  CollectionReference message =
      FirebaseFirestore.instance.collection('messages');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => ChatBubble(),
              itemCount: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                message.add({'message': data});
                controller.clear();
              },
              decoration: InputDecoration(
                hintText: 'Message',
                suffixIcon: Icon(
                  Icons.send,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

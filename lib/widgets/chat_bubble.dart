import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({
    Key? key,
  }) : super(key: key);

  CollectionReference message =
      FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: message.doc('DIRHiPqkaIqejY3NOZzs').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              
          return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                "${snapshot.data!.data}",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              margin: EdgeInsets.all(10),
              padding:
                  EdgeInsets.only(left: 30, top: 16, bottom: 16, right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: Colors.blue[700],
              ),
            ),
          );
        });
  }
}

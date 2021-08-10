import 'package:chat_app/widgets/chat/MessageBubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt')
          .snapshots(),
      builder: (ctx, AsyncSnapshot<dynamic> snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final messages = snapShot.data.docs;
        return ListView.builder(
          itemCount: messages.length,
          itemBuilder: (ctx, index) {
            return MessageBubble(
              messages[index]['text'],
              FirebaseAuth.instance.currentUser!.uid ==
                  messages[index]['userId'],
              messages[index]['username'],
            );
          },
        );
      },
    );
  }
}

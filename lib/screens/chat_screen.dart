import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chats/17yboPRSyDBxNOZ5JaEO/messages')
            .snapshots(),
        builder: (BuildContext ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            // this if() is necessary, otherwise we get error
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final documents = streamSnapshot
              .data!.docs; // Access to our documents in our firestore DB
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, index) => Container(
              child: Text(documents[index]['message']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/17yboPRSyDBxNOZ5JaEO/messages')
              .add(
            {
              'message': 'Added By Button',
            },
          );
        },
      ),
    );
  }
}

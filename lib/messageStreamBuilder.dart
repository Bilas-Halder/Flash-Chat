import 'package:flash_chat/utilities/messageBubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageStreamBuilder extends StatelessWidget {

  final firestoreInstance;
  final user;
  MessageStreamBuilder({this.user,this.firestoreInstance});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestoreInstance.collection('messages').snapshots(),
      builder: (context, snapshot) {
        List<MessageBubble> messageWidgets = [];

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.docs;
        int i = 1;
        for (var message in messages) {
          ///message.data() is just an object. so we have to convert it into map for using
          Map<String, dynamic> obj = message.data();
          MessageBubble textWidget = MessageBubble(
            text: obj['text'],
            sender: obj['sender'],
            userEmail: user.email,
          );
          messageWidgets.add(textWidget);

          // print(obj['text']+'  '+obj['sender']+' ' + i.toString());
          i++;
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}
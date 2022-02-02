import 'package:flash_chat/utilities/messageBubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageStreamBuilder extends StatelessWidget {

  final firestoreInstance;
  final user;
  final ScrollController scrollController;
  MessageStreamBuilder({this.user,this.firestoreInstance,this.scrollController});

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
        List <Map<String, dynamic>> list = [];
        for (var message in messages) {
          ///message.data() is just an object. so we have to convert it into map for using
          Map<String, dynamic> obj = message.data();
          list.add(obj);
          // print(obj['text']+'  '+obj['sender']+' ' + i.toString());
          i++;
        }
        list.sort(compareFunction);
        list;
        for(var msg in list){
          MessageBubble textWidget = MessageBubble(
            text: msg['text'],
            sender: msg['sender'],
            userEmail: user.email,
          );
          messageWidgets.add(textWidget);
        }

        return Expanded(
          child: ListView(
            controller: scrollController,
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}

int compareFunction (Map<String, dynamic>a,Map<String, dynamic>b){
  int ans = a['dateTime'].compareTo(b['dateTime']);
  if (ans == -1) return 1;
  if (ans == 1) return -1;
  return ans;
}
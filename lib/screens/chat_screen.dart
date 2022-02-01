import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/Authentication/Authentication.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:provider/src/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import '../messageStreamBuilder.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class ChatScreen extends StatefulWidget {
  static final String path = '/chat';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  IO.Socket socket;

  // final _fireStore = FirebaseFirestore.instance;
  final messageTextController = TextEditingController();
  String massage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
  }

  ///stream gives continuous data. if data is changed in database it will push a new data including the change in the data base. it's not replacing the past one it just adding new list of data into the stream.

  // void getMessagesStream() async {
  //   await for (var snapshot in _fireStore.collection('messages').snapshots()) {
  //     for (var message in snapshot.docs) {
  //       print(message.data());
  //     }
  //   }
  // }

  void connect(){
    socket = IO.io('http://192.168.1.144:5000',<String,dynamic>{
      'transports': ['websocket'],
      'autoConnect': false
    });
    socket.connect();
    socket.emit("/test","Hello World");
    socket.onConnect((data) => print("Connected with node........"));
    print(socket.connected);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                context.read<AuthenticationService>().signOut();
                Navigator.pushNamed(context, WelcomeScreen.path);
              }),
        ],
        title: Row(
          children: [
            Hero(
              tag: 'logo',
              child: Text('⚡️'),
            ),
            Text(' Chat'),
          ],
        ),
        backgroundColor:  Color(0xff005880),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // MessageStreamBuilder(
            //   // firestoreInstance: _fireStore,
            //   user: user,
            // ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        massage = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageTextController.clear();
                      // _fireStore
                      //     .collection('messages')
                      //     .add({'text': massage, 'sender': user.email});
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


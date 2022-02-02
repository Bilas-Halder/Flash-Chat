import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text, sender, userEmail;
  MessageBubble({this.text, this.sender, this.userEmail}) ;

  @override
  Widget build(BuildContext context) {
    final bool isSame=sender==userEmail;
    if(isSame)return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 30,
        right: 10
      ),
      child: ActualMsgBubble(isSame: isSame, sender: sender, text: text),
    );

    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 10,
        right: 30
      ),
      child: ActualMsgBubble(isSame: isSame, sender: sender, text: text),
    );
  }
}

class ActualMsgBubble extends StatelessWidget {
  const ActualMsgBubble({
    Key key,
    @required this.isSame,
    @required this.sender,
    @required this.text,
  }) : super(key: key);

  final bool isSame;
  final String sender;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isSame? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            sender,
            style: TextStyle(
                fontSize: 13.0,
                color: Colors.black54
            ),
          ),
        ),
        Material(
          elevation: 5,
          color: isSame?Colors.blueAccent:Color(0xff008ac8),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
            topLeft: isSame? Radius.circular(30): Radius.circular(0),
            topRight: isSame? Radius.circular(0): Radius.circular(30),
          ),
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                color: isSame?Color(0xffececec):Colors.white
              ),
            ),
          ),
        ),
      ],
    );
  }
}
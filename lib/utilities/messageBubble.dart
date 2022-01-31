import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text, sender, userEmail;
  MessageBubble({this.text, this.sender, this.userEmail}) ;

  @override
  Widget build(BuildContext context) {
    final bool isSame=sender==userEmail;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
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
            color: isSame?Color(0xff008ac8): Color(0xff12b6ff),
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
                  color: isSame?Colors.white:Colors.black87
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
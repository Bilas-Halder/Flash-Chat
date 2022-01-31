import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final hintText;
  final String type;
  final Function (String) onChanged;
  InputTextField({this.hintText,this.onChanged, this.type});

  @override
  Widget build(BuildContext context) {

    String type = this.type!=null ? this.type : '';

    return TextField(
      keyboardType: type.toLowerCase()=='email'? TextInputType.emailAddress: TextInputType.text,
      obscureText: type.toLowerCase()=='password',
      onChanged: onChanged!=null?onChanged:(String){},
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
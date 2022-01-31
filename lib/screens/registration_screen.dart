import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/utilities/buttons.dart';
import 'package:flash_chat/utilities/inputField.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static final String path ='/registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email,password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            InputTextField(
              hintText: 'Enter your email',
              onChanged: (String value){
                email=value;
              },
              type: 'email',
            ),
            SizedBox(
              height: 8.0,
            ),
            InputTextField(
              hintText: 'Enter your password',
              onChanged: (String value){
                password=value;
              },
              type: 'password',
            ),
            SizedBox(
              height: 24.0,
            ),
            LogInButton(
              title: 'Register',
              color: Colors.blueAccent,
              onPressed: () {
                print(email);
                print(password);
              },
            ),
          ],
        ),
      ),
    );
  }
}


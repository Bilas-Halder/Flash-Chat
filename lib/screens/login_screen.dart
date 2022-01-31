import 'package:flash_chat/utilities/buttons.dart';
import 'package:flash_chat/utilities/inputField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static final String path ='/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                print(value);
              },
              type: 'email',
            ),
            SizedBox(
              height: 8.0,
            ),
            InputTextField(
              hintText: 'Enter your password',
              onChanged: (String value){
                print(value);
              },
              type: 'password',
            ),
            SizedBox(
              height: 24.0,
            ),
            LogInButton(
              title: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.path);
              },
            ),
          ],
        ),
      ),
    );
  }
}

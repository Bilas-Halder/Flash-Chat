import 'package:flash_chat/Authentication/Authentication.dart';
import 'package:flash_chat/utilities/buttons.dart';
import 'package:flash_chat/utilities/inputField.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static final String path ='/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String email,password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
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
                  password = value;
                },
                type: 'password',
              ),
              SizedBox(
                height: 24.0,
              ),
              LogInButton(
                title: 'Log In',
                color: Colors.lightBlueAccent,
                onPressed: () async {
                  setState(() {
                    showSpinner=true;
                  });
                  try{
                    final msg = await context.read <AuthenticationService>().signIn(email: email, password: password);

                    print(msg);
                    if(msg == 'Signed In'){
                      Navigator.pushNamed(context, ChatScreen.path);
                    }
                  }
                  catch (e){
                    print(e);
                  }
                  finally{
                    setState(() {
                      showSpinner=false;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

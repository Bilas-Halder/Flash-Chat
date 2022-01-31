import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/Authentication/Authentication.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/utilities/buttons.dart';
import 'package:flash_chat/utilities/inputField.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static final String path ='/registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //
  // final _auth = FirebaseAuth.instance;

  String email,password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {

    final user = context.watch <User>();

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
                onPressed: () async {
                  setState(() {
                    showSpinner=true;
                  });

                  try{
                    final msg = await context.read <AuthenticationService>().signUp(email: email, password: password);

                    print(msg);
                    if(msg == 'Signed Up'){
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


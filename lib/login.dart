import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final Color primaryColor = Color(0xff18203d);
final Color secondaryColor = Color(0xff232c51);

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(backgroundColor: primaryColor, body: LoginContainer()));
  }
}

class LoginContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.audiotrack,
          color: Colors.blueAccent,
          size: 250,
        ),
        SizedBox(
          height: 20,
        ),
        LoginForm()
      ],
    ));
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondaryColor,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            icon: Icon(Icons.email)
          )),
    );
  }
}

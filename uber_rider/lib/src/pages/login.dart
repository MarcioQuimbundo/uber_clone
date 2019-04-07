import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Widget child;

  LoginPage({Key key, this.child}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       width: double.infinity,
       decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage("assets/images/bg.jpg"),
         )
       ),
    );
  }
}
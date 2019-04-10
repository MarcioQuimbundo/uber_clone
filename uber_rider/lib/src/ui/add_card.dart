import 'package:flutter/material.dart';

class AddCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AddCardView();
  }
}

class AddCardView extends StatefulWidget {
  @override
  _AddCardViewState createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Add Card "),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          padding: EdgeInsets.only(left: 20),
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}

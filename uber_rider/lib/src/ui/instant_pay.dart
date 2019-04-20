import 'package:flutter/material.dart';

class InstanstPayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InstanstPayView();
  }
}

class InstanstPayView extends StatefulWidget {
  @override
  _InstanstPayViewState createState() => _InstanstPayViewState();
}

class _InstanstPayViewState extends State<InstanstPayView> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Instant Pay"),
        ),
        body: ListView(
          children: <Widget>[
          ],
        ));
  }
}

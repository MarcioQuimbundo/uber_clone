import 'package:flutter/material.dart';

class RecentTransactionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RecentTransactionsView();
  }
}

class RecentTransactionsView extends StatefulWidget {
  @override
  _RecentTransactionsViewState createState() => _RecentTransactionsViewState();
}

class _RecentTransactionsViewState extends State<RecentTransactionsView> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Activity"),
        ),
        body: ListView(
          children: <Widget>[
          ],
        ));
  }
}

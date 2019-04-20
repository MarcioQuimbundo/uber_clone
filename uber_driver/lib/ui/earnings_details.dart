import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class EarningsDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EarningsDetailsView();
  }
}

class EarningsDetailsView extends StatefulWidget {
  @override
  _EarningsDetailsViewState createState() => _EarningsDetailsViewState();
}

class _EarningsDetailsViewState extends State<EarningsDetailsView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Weekly"),
        ),
        body: ListView(
          children: <Widget>[
          ],
        ));
  }
}

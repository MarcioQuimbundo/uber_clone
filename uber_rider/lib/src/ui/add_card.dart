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
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2019, 04),
      lastDate: DateTime(2030)
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
       selectedDate = picked; 
      });
    }
  }
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
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.credit_card), labelText: "Card Number")),
            Row(
              children: <Widget>[
                Flexible(child: TextField(decoration: InputDecoration(hintText: "MM/YY"))),
                SizedBox(width: 40),
                Flexible(child: TextField(decoration: InputDecoration(hintText: "CVV"))),
              ],
            ),
            TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.credit_card), labelText: "Country")),
            TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.credit_card), labelText: "Zip Code")),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddPaymentMethodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AddPaymentMethodView();
  }
}

class AddPaymentMethodView extends StatefulWidget {
  @override
  _AddPaymentMethodViewState createState() => _AddPaymentMethodViewState();
}

class _AddPaymentMethodViewState extends State<AddPaymentMethodView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Add Payment Method"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          padding: EdgeInsets.only(left: 20),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40),
                          child: Row(
                children: <Widget>[
                  Icon(Icons.payment),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Credit or Debit Card"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
                          child: Row(
                children: <Widget>[
                  Icon(Icons.payment),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Paypal"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

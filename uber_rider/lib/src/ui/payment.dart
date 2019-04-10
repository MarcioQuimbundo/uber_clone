import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaymentView();
  }
}

class PaymentView extends StatefulWidget {
  @override
  _PaymentViewState createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          padding: EdgeInsets.only(left: 20),
          children: <Widget>[
            Text("Payment Methods"),
            Row(
              children: <Widget>[
                Icon(Icons.payment),
                Text("Paypal"),
              ],
            ),
            Text("Add Payment Method"),
            Divider(),
            Text("Promotions"),
            Row(
              children: <Widget>[
                Icon(Icons.card_giftcard),
                Text("Rewards"),
                Spacer(),
                Text("1"),
              ],
            ),
            Text("Add Promo/Gift Code"),
          ],
        ),
      ),
    );
  }
}

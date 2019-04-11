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
        backgroundColor: Colors.black,
        title: Text("Payment"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          padding: EdgeInsets.only(left: 20),
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(vertical: 26),
                child: Text(
                  "Payment Methods",
                  style: TextStyle(color: Colors.grey),
                )),
            Row(
              children: <Widget>[
                Icon(Icons.payment),
                SizedBox(
                  width: 10,
                ),
                Text("Paypal"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {Navigator.pushNamed(context, '/add_payment');},
                child: Text(
              "Add Payment Method",
              style: TextStyle(color: Colors.blue),
            )),
            Divider(),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Promotions",
                  style: TextStyle(color: Colors.grey),
                )),
            Row(
              children: <Widget>[
                Icon(Icons.card_giftcard),
                SizedBox(
                  width: 10,
                ),
                Text("Rewards"),
                Spacer(),
                Text("1"),
                SizedBox(width: 20,)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {print("Payment Method");},
                child: Text(
              "Add Promo/Gift Code",
              style: TextStyle(color: Colors.blue),
            )),
          ],
        ),
      ),
    );
  }
}

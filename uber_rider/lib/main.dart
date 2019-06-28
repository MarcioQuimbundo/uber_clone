import 'package:flutter/material.dart';
import 'package:uber_rider/src/ui/add_card.dart';
import 'package:uber_rider/src/ui/add_payment_method.dart';
import 'package:uber_rider/src/ui/free_rides.dart';
import 'package:uber_rider/src/ui/help.dart';
import 'package:uber_rider/src/ui/home.dart';
import 'package:uber_rider/src/ui/login.dart';
import 'package:uber_rider/src/ui/payment.dart';
import 'package:uber_rider/src/ui/select_issue.dart';
import 'package:uber_rider/src/ui/settings.dart';
import 'package:uber_rider/src/ui/your_trips.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uber Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: './',
      routes: {
        '/': (context) => LoginPage(),//MyHomePage(title: 'Uber Clone'),
        '/login': (context) => LoginPage(),
        '/payment': (context) => PaymentPage(),
        '/add_payment': (context) => AddPaymentMethodPage(),
        '/add_card': (context) => AddCardPage(),
        '/your_trip': (context) => YourTripPage(),
        '/select_issue': (context) => SelectIssuePage(),
        '/free_rides': (context) => FreeRidesPage(),
        '/help': (context) => HelpPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uber_rider/src/blocs/auth_bloc.dart';
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

void main() => runApp(MyApp(
    AuthBloc(),
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uber Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: './',
      routes: {
        '/home': (context) => MyHomePage(title: 'Uber Clone'),
        '/': (context) => LoginPage(),
        '/payment': (context) => PaymentPage(),
        '/add_payment': (context) => AddPaymentMethodPage(),
        '/add_card': (context) => AddCardPage(),
        '/your_trip': (context) => YourTripPage(),
        '/select_issue': (context) => SelectIssuePage(),
        '/free_rides': (context) => FreeRidesPage(),
        '/help': (context) => HelpPage(),
        '/settings': (context) => SettingsPage(),
      },
    )));

class MyApp extends InheritedWidget {
  final AuthBloc authBloc;
  final Widget child;
  MyApp(this.authBloc, this.child) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static MyApp of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MyApp);
  }
}

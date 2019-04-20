import 'package:flutter/material.dart';
import 'package:uber_driver/ui/home.dart';
import 'package:uber_driver/ui/notifications.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Uber Clone'),
        '/notifications': (context) => NotificationsPage(),
      },
    );
  }
}

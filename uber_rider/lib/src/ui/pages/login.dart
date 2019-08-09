import 'package:flutter/material.dart';
import 'package:uber_rider/src/ui/widgets/exhibition_%20bottom_sheet.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginView();
  }
}

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/bg.jpg",
                    ),
                    fit: BoxFit.cover)),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 15,
                        spreadRadius: 1)
                  ],
                ),
                width: 120,
                height: 120,
                margin: EdgeInsets.only(bottom: 190),
                child: Center(
                    child: Text("UBER",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26))),
              ),
            ),
          ),
          ExhibitionBottomSheet(),
        ],
      ),
    );
  }
}

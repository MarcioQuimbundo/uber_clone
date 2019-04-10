import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uber Clome',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Uber Clone'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(40.7128, -74.0060),
    zoom: 16.0,
    bearing: 192.8334901395799,
    tilt: 59.440717697143555,
  );

  static final CameraPosition _iniCameraPosition = CameraPosition(
    target: LatLng(40.7128, -74.0060),
    zoom: 16.0,
    bearing: 192.8334901395799,
    tilt: 59.440717697143555,
  );
  @override
  void initState() {
    super.initState();
  }

  Future<void> _initCameraPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(_iniCameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              accountName: Text("Márcio Quimbundo"),
              accountEmail: Row(
                children: <Widget>[
                  Text("5.0"),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 12,
                  )
                ],
              ),
              currentAccountPicture: ClipOval(
                child: Image.asset(
                  "assets/images/user_profile.jpg",
                  width: 10,
                  height: 10,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  linkMenuDrawer('Payment'),
                  linkMenuDrawer('Your Trips'),
                  linkMenuDrawer('Free Rides'),
                  linkMenuDrawer('Help'),
                  linkMenuDrawer('Settings'),
                  Divider(color: Colors.black45,),
                  linkMenuDrawer('Drive With Uber'),
                  linkMenuDrawer('Legal'),
                ]),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              _initCameraPosition();
            },
          ),
          Positioned(
            top: 100.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 5.0),
                      blurRadius: 15,
                      spreadRadius: 3)
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Where to?",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
                ),
              ),
            ),
          ),
          Positioned(
              top: 30,
              left: 6,
              child: IconButton(
                icon: Icon(Icons.menu),
                color: Colors.black,
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                },
              )),
          Positioned(
            bottom: 15,
            right: 25.0,
            left: 25.0,
            child: Row(
              children: <Widget>[
                FunctionalButton(
                  icon: Icons.work,
                  title: "Work",
                  onPressed: _initCameraPosition,
                ),
                FunctionalButton(
                  icon: Icons.home,
                  title: "Home",
                  onPressed: () {},
                ),
                FunctionalButton(
                  icon: Icons.timer,
                  title: "Zinc Gym",
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FunctionalButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final Function() onPressed;

  const FunctionalButton({Key key, this.title, this.icon, this.onPressed})
      : super(key: key);

  @override
  _FunctionalButtonState createState() => _FunctionalButtonState();
}

class _FunctionalButtonState extends State<FunctionalButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RawMaterialButton(
          onPressed: widget.onPressed,
          splashColor: Colors.black,
          fillColor: Colors.white,
          elevation: 15.0,
          shape: CircleBorder(),
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                widget.icon,
                size: 30.0,
                color: Colors.black,
              )),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 15.0, color: Colors.black),
          ),
        )
      ],
    );
  }
}

Widget linkMenuDrawer(String title) {
  return InkWell(
    onTap: () {},
    splashColor: Colors.black,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
      width: double.infinity,
      child: Text(
        title,
        style: TextStyle(fontSize: 15.0),
      ),
    ),
  );
}

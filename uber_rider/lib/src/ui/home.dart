
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState();

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  Completer<GoogleMapController> _controller = Completer();
  Map<PolylineId, Polyline> polylines = <PolylineId, Polyline>{};
  int _polylineIdCounter = 1;
  PolylineId selectedPolyline;

  // Values when toggling polyline color
  int colorsIndex = 0;
  List<Color> colors = <Color>[
    Colors.purple,
    Colors.red,
    Colors.green,
    Colors.pink,
  ];

  // Values when toggling polyline width
  int widthsIndex = 0;
  List<int> widths = <int>[10, 20, 5];

  int jointTypesIndex = 0;
  List<JointType> jointTypes = <JointType>[
    JointType.mitered,
    JointType.bevel,
    JointType.round
  ];

  // Values when toggling polyline end cap type
  int endCapsIndex = 0;
  List<Cap> endCaps = <Cap>[Cap.buttCap, Cap.squareCap, Cap.roundCap];

  // Values when toggling polyline start cap type
  int startCapsIndex = 0;
  List<Cap> startCaps = <Cap>[Cap.buttCap, Cap.squareCap, Cap.roundCap];

  // Values when toggling polyline pattern
  int patternsIndex = 0;
  List<List<PatternItem>> patterns = <List<PatternItem>>[
    <PatternItem>[],
    <PatternItem>[
      PatternItem.dash(30.0),
      PatternItem.gap(20.0),
      PatternItem.dot,
      PatternItem.gap(20.0)
    ],
    <PatternItem>[PatternItem.dash(30.0), PatternItem.gap(20.0)],
    <PatternItem>[PatternItem.dot, PatternItem.gap(10.0)],
  ];

  //GoogleMapController _mapController;

  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(-8.913025, 13.202462),
    zoom: 17.0,
  );

  @override
  void initState() {
    //_mapController.mar();
    super.initState();
  }

  void _onPolylineTapped(PolylineId polylineId) {
    setState(() {
      selectedPolyline = polylineId;
    });
  }

  void _addHomePoly() {
    _homeCameraPosition();
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.black,
      width: 5,
      points: _createHomePoints(),
      onTap: () {
        _onPolylineTapped(polylineId);
      },
    );

    setState(() {
      polylines[polylineId] = polyline;
    });
  }

  void _addGymPoly() {
    _gymCameraPosition();
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.black,
      width: 5,
      points: _createGymPoints(),
      onTap: () {
        _onPolylineTapped(polylineId);
      },
    );

    setState(() {
      polylines[polylineId] = polyline;
    });
  }

  void _addWorkPoly() {
    _workCameraPosition();
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.black,
      width: 5,
      points: _createWorkPoints(),
      onTap: () {
        _onPolylineTapped(polylineId);
      },
    );

    setState(() {
      polylines[polylineId] = polyline;
    });
  }

  Future<void> _homeCameraPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(-8.913394, 13.202649),
      zoom: 18.10,
    )));
  }

  Future<void> _gymCameraPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(-8.912014, 13.204197),
      zoom: 18.5,
    )));
  }

  Future<void> _workCameraPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(-8.914843, 13.201518),
      zoom: 18.5,
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      bottomSheet: Container(
        height: 300,
        decoration: BoxDecoration(
          color: Colors.black
        ),
        child: Column(

        ),
      ),
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
                  linkMenuDrawer('Payment', () {
                    Navigator.pushNamed(context, '/payment');
                  }),
                  linkMenuDrawer('Your Trips', () {
                    Navigator.pushNamed(context, '/your_trip');
                  }),
                  linkMenuDrawer('Free Rides', () {
                    Navigator.pushNamed(context, '/free_rides');
                  }),
                  linkMenuDrawer('Help', () {
                    Navigator.pushNamed(context, '/help');
                  }),
                  linkMenuDrawer('Settings', () {
                    Navigator.pushNamed(context, '/settings');
                  }),
                  /*Divider(
                    color: Colors.black45,
                  ),
                  linkMenuDrawer('Drive With Uber', () {}),
                  linkMenuDrawer('Legal', () {}),*/
                ]),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            polylines: Set<Polyline>.of(polylines.values),
            mapType: MapType.normal,
            initialCameraPosition: _cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              //_initCameraPosition();
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
                  icon: Container(margin: EdgeInsets.only(left: 20, top: 18), width: 10, height: 10, decoration: BoxDecoration(color: Colors.black)),
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
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FunctionalButton(
                    icon: Icons.work,
                    title: "Work",
                    onPressed: _addWorkPoly,
                  ),
                  FunctionalButton(
                    icon: Icons.home,
                    title: "Home",
                    onPressed: _addHomePoly,
                  ),
                  FunctionalButton(
                    icon: Icons.timer,
                    title: "Zinc Gym",
                    onPressed: _addGymPoly,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  LatLng _createLatLng(double lat, double lng) {
    return LatLng(lat, lng);
  }

  List<LatLng> _createHomePoints() {
    final List<LatLng> points = <LatLng>[];
    points.add(_createLatLng(-8.913012, 13.202450));
    points.add(_createLatLng(-8.913297, 13.202253));
    points.add(_createLatLng(-8.913752, 13.202803));
    points.add(_createLatLng(-8.913455, 13.203063));
    points.add(_createLatLng(-8.913012, 13.202450));
    return points;
  }

  List<LatLng> _createGymPoints() {
    final List<LatLng> points = <LatLng>[];
    points.add(_createLatLng(-8.911857, 13.203656));
    points.add(_createLatLng(-8.911580, 13.204369));
    points.add(_createLatLng(-8.912060, 13.204649));
    points.add(_createLatLng(-8.912406, 13.204128));
    points.add(_createLatLng(-8.911857, 13.203656));
    return points;
  }

  List<LatLng> _createWorkPoints() {
    final List<LatLng> points = <LatLng>[];
    points.add(_createLatLng(-8.914580, 13.202106));
    points.add(_createLatLng(-8.915066, 13.201708));
    points.add(_createLatLng(-8.915269, 13.201441));
    points.add(_createLatLng(-8.915345, 13.201232));
    points.add(_createLatLng(-8.915301, 13.201075));
    points.add(_createLatLng(-8.915058, 13.200855));
    points.add(_createLatLng(-8.914824, 13.201195));
    points.add(_createLatLng(-8.914180, 13.201826));
    points.add(_createLatLng(-8.914580, 13.202106));

    return points;
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

Widget linkMenuDrawer(String title, Function onPressed) {
  return InkWell(
    onTap: onPressed,
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

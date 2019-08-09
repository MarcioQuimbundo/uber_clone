import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HelpView();
  }
}

class HelpView extends StatefulWidget {
  @override
  _HelpViewState createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  Completer<GoogleMapController> _controller = Completer();
  Map<PolylineId, Polyline> polylines = <PolylineId, Polyline>{};
  int _polylineIdCounter = 1;
  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(-8.913455, 13.203063),
    zoom: 17.18,
  );

  @override
  void initState() {
    super.initState();
    _addtripPoly();
  }

  void _addtripPoly() {
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.black,
      width: 5,
      points: _createTripPoints(),
      onTap: () {},
    );

    setState(() {
      polylines[polylineId] = polyline;
    });
  }

  LatLng _createLatLng(double lat, double lng) {
    return LatLng(lat, lng);
  }

  List<LatLng> _createTripPoints() {
    final List<LatLng> points = <LatLng>[];
    points.add(_createLatLng(-8.913012, 13.202450));
    points.add(_createLatLng(-8.913297, 13.202253));
    points.add(_createLatLng(-8.913752, 13.202803));
    points.add(_createLatLng(-8.913455, 13.203063));
    return points;
  }

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Help"),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.grey.withOpacity(0.15),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Your last trip",
                    style: TextStyle(fontSize: 18),
                  )),
            ),
            ListTile(
              leading: ClipOval(
                child: Image.asset(
                  "assets/images/user_profile.jpg",
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text("Today at 1:05 AM"),
              subtitle: Row(
                children: <Widget>[
                  Text("Infinity G Coupe"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("ABC123",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
              trailing: Text("\$7.42"),
            ),
            Container(
              height: 150,
              width: double.infinity,
              child: GoogleMap(
                polylines: Set<Polyline>.of(polylines.values),
                mapType: MapType.normal,
                initialCameraPosition: _cameraPosition,
                onTap: (LatLng location) {
                  Navigator.pushNamed(context, "/select_issue");
                },
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Report an issue with this trip",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.grey.withOpacity(0.15),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Additional topics",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      "Trips and Fare Review",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      "A Guide to Uber",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      "Accessibility",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      "Acount and Payment",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      "Driving with Uber",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      "Delivery",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      "Events and Inquiries",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      "I was envolved in an acident",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      "UberPOOL issues",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      "Critical Safety Response Line",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

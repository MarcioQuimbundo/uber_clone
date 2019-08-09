import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class SelectIssuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SelectIssueView();
  }
}

class SelectIssueView extends StatefulWidget {
  @override
  _SelectIssueViewState createState() => _SelectIssueViewState();
}

class _SelectIssueViewState extends State<SelectIssueView> {
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
          title: Text("Select an Issue"),
          actions: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      "RECEIPT",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 150,
              width: double.infinity,
              child: GoogleMap(
                polylines: Set<Polyline>.of(polylines.values),
                mapType: MapType.normal,
                initialCameraPosition: _cameraPosition,
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
                children: <Widget>[
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
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      ClipOval(
                          child: Container(
                        color: Colors.black,
                        width: 10,
                        height: 10,
                      )),
                      SizedBox(width: 20,),
                      Text("Lenox PKwy, Atlanta, GA 30326, USA")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        color: Colors.black,
                        width: 10,
                        height: 10,
                      ),
                      SizedBox(width: 20,),
                      Text("4040 Peachtree Rd NE, Atlanta, GA 30319, USA")
                    ],
                  ),
                  SizedBox(height: 10,),
                  LinearProgressIndicator(backgroundColor: Colors.black, valueColor: null,),
                  SizedBox(height: 30,),
                  ListTile(
                    onTap: (){},
                    title: Text("I lost an item",style: TextStyle(fontSize: 18),),
                  ),
                  Divider(),
                  ListTile(
                    onTap: (){},
                    title: Text("I was incorrectly charged a cancellation fee",style: TextStyle(fontSize: 18),),
                  ),
                  Divider(),
                  ListTile(
                    onTap: (){},
                    title: Text("I would like a refund",style: TextStyle(fontSize: 18),),
                  ),
                  Divider(),
                  ListTile(
                    onTap: (){},
                    title: Text("My driver was unprofessional",style: TextStyle(fontSize: 18),),
                  ),
                  Divider(),
                  ListTile(
                    onTap: (){},
                    title: Text("My vehicle wasn't what I expected",style: TextStyle(fontSize: 18),),
                  ),
                  Divider(),
                  ListTile(
                    onTap: (){},
                    title: Text("I had an issue with receipt or payment option",style: TextStyle(fontSize: 18),),
                  ),
                  Divider(),
                  ListTile(
                    onTap: (){},
                    title: Text("I had an issue with my promo code or payment option",style: TextStyle(fontSize: 18),),
                  ),
                  Divider(),
                  ListTile(
                    onTap: (){},
                    title: Text("I was envolved in an acident",style: TextStyle(fontSize: 18),),
                  ),
                  Divider(),
                  ListTile(
                    onTap: (){},
                    title: Text("UberPOOL issues",style: TextStyle(fontSize: 18),),
                  ),
                  Divider(),
                  ListTile(
                    onTap: (){},
                    title: Text("Critical Safety Response Line",style: TextStyle(fontSize: 18),),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

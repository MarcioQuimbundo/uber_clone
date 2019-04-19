import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';



class YourTripPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return YourTripView();
  }
}

class YourTripView extends StatefulWidget {
  @override
  _YourTripViewState createState() => _YourTripViewState();
}

class _YourTripViewState extends State<YourTripView> {
  
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
      onTap: () {
        
      },
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
        title: Text("Your Trips"),
        
      ),
      body: Column(
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
                onTap: (LatLng location) {
                  Navigator.pushNamed(context, "/select_issue");
                },
              ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Today at 1:05 AM", style: TextStyle(fontWeight: FontWeight.bold,)),
                    Spacer(),
                    Text("7.42USD", style: TextStyle(fontWeight: FontWeight.bold,)),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: <Widget>[
                    Text("Infinity G Coupe"),
                    SizedBox(width: 10,),
                    Text("ABC123", style: TextStyle(fontWeight: FontWeight.bold,))
                  ],
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}

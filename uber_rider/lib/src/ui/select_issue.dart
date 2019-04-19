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
              Container(padding: EdgeInsets.only(right: 10), child: Text("RECEIPT", style: TextStyle(color: Colors.white),))
            ],
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: double.infinity,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _cameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                _initCameraPosition();
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

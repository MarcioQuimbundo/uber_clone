import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'package:uber_rider/src/model/place_item_res.dart';
import 'package:uber_rider/src/model/step_res.dart';
import 'package:uber_rider/src/repository/place_service.dart';
import 'package:uber_rider/src/ui/widgets/functionalButton.dart';
import 'package:uber_rider/src/ui/widgets/home_menu_drawer.dart';
import 'package:uber_rider/src/ui/widgets/ride_picker.dart';
import 'package:uber_rider/src/util/map_util.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  Completer<GoogleMapController> _completer = Completer();
  MapUtil mapUtil = MapUtil();
  Location _locationService = Location();
  var currentLocation = const LatLng(-8.8301849, 13.2474807);
  LatLng _center = const LatLng(-8.8301849, 13.2474807);
  bool _permission = false;
  List<Marker> _markers = List();
  List<Polyline> routes = new List();
  int _polylineIdCounter = 1;
  bool done = false;
  String error;

  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(-8.913025, 13.202462),
    zoom: 17.0,
  );

  getCurrentLocation() async {
    currentLocation = await mapUtil.getCurrentLocation();
    _center = LatLng(currentLocation.latitude, currentLocation.longitude);
    Marker marker = Marker(
      markerId: MarkerId('location'),
      position: _center,
      infoWindow: InfoWindow(title: 'My Location'),
    );
    setState(() {
      _markers.add(marker);
      done = true;
    });
  }

  addPolyline(LatLng destin) async {
    if (done) {
      mapUtil
          .getRoutePath(
              currentLocation, new LatLng(destin.latitude, destin.longitude))
          .then((locations) {
        List<LatLng> path = new List();

        locations.forEach((location) {
          path.add(new LatLng(location.latitude, location.longitude));
        });

        final Polyline polyline = Polyline(
          polylineId: PolylineId(
              destin.latitude.toString() + destin.longitude.toString()),
          consumeTapEvents: true,
          color: Colors.black,
          width: 5,
          points: path,
        );

        setState(() {
          routes.add(polyline);
        });
      });
    } else {
      print("impossible trace route, verify if your location is on");
      /*Fluttertoast.showToast(
        msg: "Impossível traçar rota. Verifique se a localização esta activa",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14.0
      );*/
    }
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    addPolyline(LatLng(-8.913025, 13.202462));
    
    _center = LatLng(-8.913025, 13.202462);

    Marker marker = Marker(
      markerId: MarkerId("routes"),
      position: LatLng(-8.913025, 13.202462),
      infoWindow: InfoWindow(title: "trace route"),
    );
    setState(() {
      _markers.add(marker);
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      bottomSheet: Container(
        height: 300,
        decoration: BoxDecoration(color: Colors.black),
        child: Column(),
      ),
      drawer: Drawer(
        child: HomeMenuDrawer(),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 13.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _completer.complete(controller);
            },
            markers: Set<Marker>.of(_markers),
            polylines: Set<Polyline>.of(routes),
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Column(
              children: <Widget>[
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  leading: FlatButton(
                    onPressed: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                    child: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Container()//RidePicker(onPlaceSelected),
                )
              ],
            ),
          ),
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
                    onPressed: () {},
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
            ),
          )
        ],
      ),
    );
  }


  initPlatformState() async {
    await _locationService.changeSettings(
        accuracy: LocationAccuracy.HIGH, interval: 1000);

    LocationData location;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      bool serviceStatus = await _locationService.serviceEnabled();
      print("Service status: $serviceStatus");
      if (serviceStatus) {
        _permission = await _locationService.requestPermission();
        print("Permission: $_permission");
        if (_permission) {
          location = await _locationService.getLocation();
          Marker marker = Marker(
            markerId: MarkerId('localizacao'),
            position: LatLng(location.latitude, location.longitude),
            infoWindow: InfoWindow(title: 'Minha localização'),
          );
          if (mounted) {
            setState(() {
              currentLocation = LatLng(location.latitude, location.longitude);
              //_center = LatLng(currentLocation.latitude, currentLocation.longitude);
              _markers.add(marker);
              done = true;
            });
          }
        }
      } else {
        bool serviceStatusResult = await _locationService.requestService();
        print("Service status activated after request: $serviceStatusResult");
        if (serviceStatusResult) {
          initPlatformState();
        }
      }
    } on PlatformException catch (e) {
      print(e);
      if (e.code == 'PERMISSION_DENIED') {
        error = e.message;
      } else if (e.code == 'SERVICE_STATUS_ERROR') {
        error = e.message;
      }
      //location = null;
    }
  }
}

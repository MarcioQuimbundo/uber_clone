import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/geolocation.dart' as APIGeolocation;
import 'package:google_maps_webservice/directions.dart' as APIDirections;


class MapUtil{

  final directions = APIDirections.GoogleMapsDirections(apiKey: 'AIzaSyDPaFRwkTfLGUgDovW6ZrldT9e77mYR7sU');
  final geolocation = APIGeolocation.GoogleMapsGeolocation(apiKey: 'AIzaSyDPaFRwkTfLGUgDovW6ZrldT9e77mYR7sU');

  Future<LatLng> getCurrentLocation() async{
    LatLng currentLocation;
    APIGeolocation.GeolocationResponse resLocation = await geolocation.getGeolocation();
    if (resLocation.isOkay) {
      currentLocation = new LatLng(resLocation.location.lat, resLocation.location.lng);
      //print("Actual: ${resLocation.location.lat}, ${resLocation.location.lng}");
    } else {
      print(resLocation.errorMessage);
    }
    return currentLocation; 
  }

  Future<List<LatLng>> getRoutePath(LatLng origin, LatLng destin) async{
    List<LatLng> locationsSteps = [];
    APIDirections.DirectionsResponse resDirections = await directions.directionsWithLocation(
      new APIDirections.Location(origin.latitude, origin.longitude), 
      new APIDirections.Location(destin.latitude, destin.longitude),
      travelMode: APIDirections.TravelMode.driving
    );
    if (resDirections.isOkay) {
      for (var r in resDirections.routes) {
        for(var l in r.legs){
          for(var s in l.steps){
            locationsSteps.addAll(decodePoly(s.polyline.points));
          }
        }
      }
    } else {
      print(resDirections.errorMessage);
    }
    //directions.dispose();
    return locationsSteps;
  }

  List<LatLng> decodePoly(String encoded) {
 
        List<LatLng> poly = new List<LatLng>();
        int index = 0, len = encoded.length;
        num lat = 0, lng = 0;
 
        while (index < len) {
            int b, shift = 0, result = 0;
            do {
                b = encoded.codeUnitAt(index++) - 63;
                result |= (b & 0x1f) << shift;
                shift += 5;
            } while (b >= 0x20);
            int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
            lat += dlat;
 
            shift = 0;
            result = 0;
            do {
                b = encoded.codeUnitAt(index++) - 63;
                result |= (b & 0x1f) << shift;
                shift += 5;
            } while (b >= 0x20);
            int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
            lng += dlng;
 
            LatLng p = new LatLng(((lat / 1E5)),
                        ((lng / 1E5)));
            poly.add(p);
        }
 
        return poly;
    }

}


class CompositeSubscription {
  Set<StreamSubscription> _subscriptions = new Set();

  void cancel() {
    for (var n in this._subscriptions) {
      n.cancel();
    }
    this._subscriptions = new Set();
  }

  void add(StreamSubscription subscription) {
    this._subscriptions.add(subscription);
  }

  void addAll(Iterable<StreamSubscription> subs) {
    _subscriptions.addAll(subs);
  }

  bool remove(StreamSubscription subscription) {
    return this._subscriptions.remove(subscription);
  }

  bool contains(StreamSubscription subscription) {
    return this._subscriptions.contains(subscription);
  }

  List<StreamSubscription> toList() {
    return this._subscriptions.toList();
  }
}
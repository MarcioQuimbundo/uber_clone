import 'package:google_maps_flutter/google_maps_flutter.dart';

class StepRes {
  LatLng startLocation;
  LatLng endLocation;
  StepRes({this.startLocation, this.endLocation});

  factory StepRes.fromJson(Map<String, dynamic> json) {
    return StepRes(
        startLocation: LatLng(
            json["start_location"]["lat"], json["start_location"]["lng"]),
        endLocation:
            LatLng(json["end_location"]["lat"], json["end_location"]["lng"]));
  }
}

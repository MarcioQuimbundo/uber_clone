import 'dart:async';

import 'package:uber_rider/src/repository/place_service.dart';

class PlaceBloc {
  var _placeController = StreamController.broadcast();
  Stream get placeStream => _placeController.stream;

  void searchPlace(String keyword) {
    _placeController.sink.add("start");
    PlaceService.searchPlace(keyword).then((rs) {
      _placeController.sink.add(rs);
    }).catchError(() {
      //sink stop
    });
  }

  void dispose() {
    _placeController.close();
  }
}

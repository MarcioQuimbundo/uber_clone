import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_rider/src/blocs/place_bloc.dart';
import 'package:uber_rider/src/model/place_item_res.dart';
import 'package:uber_rider/src/ui/widgets/home_menu_drawer.dart';

class RidePickerPage extends StatefulWidget {
  final String selectedAddress;
  final Function(PlaceItemRes, bool) onSelected;
  final bool _isFromAddress;
  RidePickerPage(this.selectedAddress, this.onSelected, this._isFromAddress);

  @override
  _RidePickerPageState createState() => _RidePickerPageState();
}

class _RidePickerPageState extends State<RidePickerPage> {
  var _addressController;
  var placeBloc = PlaceBloc();
  _RidePickerPageState();
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(-8.913025, 13.202462),
    zoom: 17.0,
  );

  @override
  void initState() {
    _addressController = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    placeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: Container(
        height: 100,
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
            initialCameraPosition: _cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
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
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x88999999),
                            offset: Offset(0, 5),
                            blurRadius: 5.0)
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: FlatButton(
                            onPressed: () {},
                            child: SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: Stack(
                                alignment: AlignmentDirectional.centerStart,
                                children: <Widget>[
                                  SizedBox(
                                    height: 40.0,
                                    width: 50.0,
                                    child: Center(
                                      child: Container(
                                          margin: EdgeInsets.only(top: 2),
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                              color: Colors.black)),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    width: 40,
                                    height: 50,
                                    child: Center(
                                      child: Icon(
                                        Icons.close,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 40.0, right: 50.0, top: 14),
                                          child: TextField(
                                            style: TextStyle(fontSize: 16),
                                            controller: _addressController,
                                            textInputAction:
                                                TextInputAction.search,
                                            onChanged: (str) {
                                              placeBloc.searchPlace(str);
                                            },
                                            decoration:
                                                InputDecoration.collapsed(
                                                    hintText: ""),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: StreamBuilder(
                    stream: placeBloc.placeStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data == "start") {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        List<PlaceItemRes> places = snapshot.data;
                        return Container(
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x88999999),
                                        offset: Offset(0, 5),
                                        blurRadius: 5.0)
                                  ],
                                ),
                                child: ListTile(
                                  title: Text(
                                    places.elementAt(index).name,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  subtitle:
                                      Text(places.elementAt(index).address),
                                  onTap: () {
                                    print("ontap");
                                    Navigator.of(context).pop();
                                    widget.onSelected(places.elementAt(index),
                                        widget._isFromAddress);
                                  },
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                            itemCount: places.length,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

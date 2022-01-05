import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> markers = [];
  CameraPosition initCamera =
      CameraPosition(target: LatLng(-6.269381, 107.004175), zoom: 17);

  static final Marker _homeMarker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: "My Home"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(
      -6.269381,
      107.004175,
    ),
  );

  static final Marker _mieAyuMarker = Marker(
    markerId: MarkerId('_mieAyu'),
    infoWindow: InfoWindow(title: "Mie Ayu Rawalumbu"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(
      -6.2668805,
      107.0052591,
    ),
  );

  static final Polyline _kPolyLine =
      Polyline(polylineId: PolylineId("_kPolyLineId"), width: 4, points: [
    LatLng(
      -6.269381,
      107.004175,
    ),
    LatLng(
      -6.2668805,
      107.0052591,
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: {_homeMarker, _mieAyuMarker},
        polylines: {_kPolyLine},
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        mapType: MapType.normal,
        initialCameraPosition: initCamera,
      ),
    );
  }
}

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
  late GoogleMapController _controller;
  List<Marker> markers = [];
  CameraPosition initCamera =
      CameraPosition(target: LatLng(-6.259759, 107.012631), zoom: 15);

  addMarker() {
    int id = Random().nextInt(100);
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId(
            id.toString(),
          ),
          position: LatLng(-6.259759, 107.012631),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
            onTap: (coordinate) {
              _controller.animateCamera(CameraUpdate.newLatLng(coordinate));
            },
            markers: markers.toSet(),
            mapType: MapType.normal,
            initialCameraPosition: initCamera,
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
              addMarker();
            }));
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mie_ayu_rawalumbu/provider/google_map_provider.dart';
import 'package:provider/provider.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> myMarkers = [];
  String? myStreet;

  static final CameraPosition initCamera = CameraPosition(
    target: LatLng(-6.256947, 107.005014),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    GoogleMapProvider googleProvider = Provider.of<GoogleMapProvider>(context);

    Future<void> _goToTheLake() async {
      final GoogleMapController controller = await _controller.future;
      myStreet = await googleProvider.getNameLocation();
      setState(() {
        myMarkers = [];
        myMarkers.add(
          Marker(
            markerId: MarkerId("My Home"),
            position: LatLng(googleProvider.currentLatitude!,
                googleProvider.currentLongitude!),
            onTap: () {
              Future.delayed(
                  Duration(seconds: 5), () => Navigator.pop(context));
            },
            infoWindow: InfoWindow(
                title: googleProvider.street != null
                    ? googleProvider.street
                    : "My Home"),
          ),
        );
      });
      controller.animateCamera(
          CameraUpdate.newCameraPosition(googleProvider.myHome()));
    }

    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initCamera,
        markers: Set.from(myMarkers),
        zoomGesturesEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          googleProvider.getPosition();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToTheLake,
        child: Icon(Icons.home),
      ),
    );
  }
}

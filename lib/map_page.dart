import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mie_ayu_rawalumbu/provider/google_map_provider.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: initCamera,
            markers: Set.from(myMarkers),
            zoomGesturesEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              googleProvider.getPosition();
            },
          ),
          googleProvider.street != null
              ? Positioned(
                  bottom: height * 0.08,
                  child: Container(
                    width: width * 0.9,
                    height: height * 0.08,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                      color: boxDescriptionColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Alamat: ${googleProvider.street}",
                              style: primartyTextStyle.copyWith(fontSize: 12),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                width: 50,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: backgroundColor2,
                                ),
                                child: Center(
                                  child: Text(
                                    "OK",
                                    style: secondaryTextStyle.copyWith(
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                )
              : Container(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToTheLake,
        child: Icon(Icons.home),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  final Set<Marker> _markers = {};

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(3.857888, 11.500474),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(3.871058, 11.514708),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  static const CameraPosition _you = CameraPosition(
      //bearing: 192.8334901395799,
      target: LatLng(3.857888, 11.500474),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(
      const Marker(
        markerId: MarkerId('id-1'),
        position: LatLng(3.857888, 11.500474),
        infoWindow: InfoWindow(
          title: 'Google Plex',
          snippet: 'Google Headquarters',
        ),
      ),
    );
    _markers.add(
      const Marker(
        markerId: MarkerId('id-2'),
        position: LatLng(3.871058, 11.514708),
        infoWindow: InfoWindow(
          title: 'The Lake',
          snippet: 'A beautiful lake',
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: _markers,
          ),
          Positioned(
            bottom: 80,
            left: 16,
            child: FloatingActionButton.extended(
              onPressed: _goToTheLake,
              label: const Text('Votre colis'),
              icon: const Icon(Icons.directions_boat),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: FloatingActionButton.extended(
              onPressed: _goToYourLocation,
              label: const Text('Vous'),
              icon: const Icon(Icons.gps_fixed),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
  Future<void> _goToYourLocation() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_you));
  }
}
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMaps extends StatefulWidget {
  List<Position> locations;

  GoogleMaps(this.locations);

  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  GoogleMapController? _controller;
  Location currentLocation = Location();
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    setState(() {
      print("maps set state");
      for (final pos in widget.locations) {
        print(pos.latitude);
        print(pos.longitude);
        _markers.add(Marker(
            markerId: const MarkerId('Home'),
            position: LatLng(pos.latitude ?? 0.0, pos.longitude ?? 0.0)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          zoomControlsEnabled: false,
          initialCameraPosition: const CameraPosition(
            target: LatLng(48.8561, 2.2930),
            zoom: 12.0,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
            getLocation();
          },
          markers: _markers,
        ),
      ),
    );
  }

  void getLocation() {
    _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target:
            LatLng(widget.locations[0].latitude, widget.locations[0].longitude),
        zoom: 14)));
  }
}

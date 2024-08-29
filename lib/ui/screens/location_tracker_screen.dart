import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Position? _currentPosition; // Nullable Position
  GoogleMapController? _googleMapController; // Nullable GoogleMapController

  @override
  void initState() {
    super.initState();
    _getCurrentLocation(); // Fetch current location when the screen initializes
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = position; // Update the current position
      });

      // Move the map camera to the current location once it's obtained
      _googleMapController?.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(position.latitude, position.longitude),
        ),
      );
    } catch (e) {
      print('Could not get location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map Example'),
      ),
      body: GoogleMap(
        zoomControlsEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _currentPosition != null
              ? LatLng(_currentPosition!.latitude, _currentPosition!.longitude)
              : LatLng(23.698033747588205, 89.6865426376462), // Default value
          zoom: 15.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _googleMapController = controller;
          if (_currentPosition != null) {
            _googleMapController?.animateCamera(
              CameraUpdate.newLatLng(
                LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
              ),
            );
          }
        },
        onTap: (LatLng latLng) {
          print(latLng);
        },
      ),
    );
  }
}

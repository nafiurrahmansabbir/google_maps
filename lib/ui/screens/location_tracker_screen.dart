import 'package:flutter/material.dart';
import 'package:google_maps/ui/widgets/app_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationTrackerScreen extends StatefulWidget {
  const LocationTrackerScreen({super.key});

  @override
  State<LocationTrackerScreen> createState() => _LocationTrackerScreenState();
}

class _LocationTrackerScreenState extends State<LocationTrackerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LocationTrackerAppBar(),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(23.75303455618254, 89.64498547075718)
        ),
      ),
    );
  }
}

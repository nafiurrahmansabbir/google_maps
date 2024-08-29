import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps/ui/widgets/app_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationTrackerScreen extends StatefulWidget {
  const LocationTrackerScreen({super.key});

  @override
  State<LocationTrackerScreen> createState() => _LocationTrackerScreenState();
}

class _LocationTrackerScreenState extends State<LocationTrackerScreen> {
  late GoogleMapController _googleMapController;
  // final LatLng _center = const LatLng(23.75303455618254, 89.64498547075718);
  Position? _currentPosition;

  LatLng? targetLatLng;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrenLocation();
    _listenCurrenLocation();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LocationTrackerAppBar(),
      body: Center(
        child: Text('current location => $_currentPosition'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getCurrenLocation();
          _listenCurrenLocation();
        },
        child: const Icon(Icons.location_history),
      ),
    );
  }

  Future<void> _getCurrenLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      // permisson ase
      final bool isEnable = await Geolocator.isLocationServiceEnabled();
      if (isEnable) {
        //get location
        _currentPosition=await Geolocator.getCurrentPosition(
            locationSettings: const LocationSettings(
              accuracy: LocationAccuracy.best,
              distanceFilter: 10,
              timeLimit: Duration(seconds: 10),

            )
        );
        targetLatLng = LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
        if(mounted){
          setState(() {
          });
        }
      } else {
        //on gps
        Geolocator.openLocationSettings();
      }
    } else {
      // permission nai
      if (permission == LocationPermission.deniedForever) {
        Geolocator.openAppSettings();
        return;
      }
      LocationPermission requestedPermission =
      await Geolocator.requestPermission();
      if (requestedPermission == LocationPermission.always ||
          requestedPermission == LocationPermission.whileInUse) {
        _getCurrenLocation();
      }
    }
  }
  Future<void> _listenCurrenLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      // permisson ase
      final bool isEnable = await Geolocator.isLocationServiceEnabled();
      if (isEnable) {
        //get location
        Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
              // accuracy: LocationAccuracy.best,
              // distanceFilter: 10,
              // timeLimit: Duration(seconds: 10),

            )
        ).listen((p){
          print(p);
        });
        if(mounted){
          setState(() {

          });
        }
      } else {
        //on gps
        Geolocator.openLocationSettings();
      }
    } else {
      // permission nai
      if (permission == LocationPermission.deniedForever) {
        Geolocator.openAppSettings();
        return;
      }
      LocationPermission requestedPermission =
      await Geolocator.requestPermission();
      if (requestedPermission == LocationPermission.always ||
          requestedPermission == LocationPermission.whileInUse) {
        _getCurrenLocation();
      }
    }
  }
}

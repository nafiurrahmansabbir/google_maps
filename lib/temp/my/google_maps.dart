// import 'package:flutter/material.dart';
// import 'package:google_maps/ui/widgets/app_bar.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class LocationTrackerScreen extends StatefulWidget {
//   const LocationTrackerScreen({super.key});
//
//   @override
//   State<LocationTrackerScreen> createState() => _LocationTrackerScreenState();
// }
//
// class _LocationTrackerScreenState extends State<LocationTrackerScreen> {
//   late GoogleMapController _googleMapController;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: LocationTrackerAppBar(),
//       body: GoogleMap(
//         zoomControlsEnabled: true,
//         myLocationButtonEnabled: true,
//         myLocationEnabled: true,
//         // mapType: MapType.satellite,
//         mapType: MapType.normal,
//         initialCameraPosition: CameraPosition(
//           target: LatLng(23.75303455618254, 89.64498547075718),
//           zoom: 15.0,
//         ),
//         onMapCreated: (GoogleMapController controller){
//           _googleMapController=controller;
//         },
//         onTap: (LatLng latLng){
//           print(latLng);
//         },
//         //poliline
//         polylines: <Polyline>{
//           Polyline(
//             polylineId: PolylineId('sample'),
//             color: Colors.pink,
//             width: 20,
//             visible: true,
//             onTap: () {
//               print('Tap on polyline');
//             },
//             jointType: JointType.round,
//             points: [
//               LatLng(23.75705028336703, 89.64988354593515),
//               LatLng(23.745966137656776, 89.6399587020278)
//             ],
//
//           ),
//           Polyline(
//             polylineId: PolylineId('another'),
//             color: Colors.yellow,
//             points: [
//               LatLng(23.76270630481048, 89.6432202681899),
//               LatLng(23.761863379266945, 89.65055476874113)
//             ],
//           )
//         },
//
//
//         polygons: <Polygon>{
//           Polygon(
//               polygonId: PolygonId('polygone-id'),
//               visible: true,
//               fillColor: Colors.blueAccent,
//               points: [
//                 LatLng(23.756122318879466, 89.65312901884317),
//                 LatLng(23.760477925531273, 89.65330068022013),
//                 LatLng(23.759106572636608, 89.64646574109793)
//               ])
//         },
//
//         markers: <Marker>{
//           Marker(
//             markerId: MarkerId('abc-building'),
//             position: LatLng(23.747795198710694, 89.64779209345579),
//             infoWindow: InfoWindow(title: 'ABC Building'),
//             icon: BitmapDescriptor.defaultMarkerWithHue(
//                 BitmapDescriptor.hueBlue),
//           ),
//           Marker(
//             markerId: MarkerId('location-picker'),
//             position: LatLng(23.740953580807606, 89.64757282286882),
//             icon: BitmapDescriptor.defaultMarkerWithHue(
//                 BitmapDescriptor.hueOrange),
//             draggable: true,
//             onDragEnd: (LatLng lastLatLng) {
//               print('End at $lastLatLng');
//             },
//             onDragStart: (LatLng lastLatLng) {
//               print('start at $lastLatLng');
//             },
//             onDrag: (LatLng lastLatLng) {
//               print('on at $lastLatLng');
//             },
//           )
//         },
//
//       ),
//     );
//   }
// }

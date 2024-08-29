import 'package:flutter/material.dart';
import 'package:google_maps/ui/screens/location_tracker_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      debugShowCheckedModeBanner: false,
      home:  MapScreen(),
    );
  }
}




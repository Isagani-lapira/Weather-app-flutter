import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location_service.dart';
import '../utilities/constant.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late LocationService locationService = LocationService();
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    await locationService.getCurrentLocation();
    print(locationService.getLatitude());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(
              animating: true,
              radius: 50,
              color: Colors.white,
            ),
            loadingText,
          ],
        ),
      ),
    );
  }
}

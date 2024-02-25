import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/services/network.dart';
import '../utilities/constant.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late LocationService locationService = LocationService();
  late NetworkHelper networkHelper;
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    await locationService.getCurrentLocation();
    latitude = locationService.getLatitude();
    longitude = locationService.getLongitude();

    networkHelper = NetworkHelper(latitude: latitude, longitude: longitude);

    var data = await networkHelper.getData();
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
            kloadingText,
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/services/network.dart';
import '../utilities/constant.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late LocationService locationService = LocationService();
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    await locationService.getCurrentLocation();
    latitude = locationService.getLatitude();
    longitude = locationService.getLongitude();

    NetworkHelper networkHelper =
        NetworkHelper(latitude: latitude, longitude: longitude);

    networkHelper.getData();
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

// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screens/result_screen.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/services/network.dart';
import '../utilities/constant.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
    getLocationData(context); // Call getLocationData with the context
  }

  void getLocationData(BuildContext context) async {
    await locationService.getCurrentLocation();
    latitude = locationService.getLatitude();
    longitude = locationService.getLongitude();

    networkHelper = NetworkHelper(latitude: latitude, longitude: longitude);

    var data = await networkHelper.getData();
    // Navigate to ResultScreen with the fetched data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          data: data,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.fourRotatingDots(
              color: kSunnyColor,
              size: 45.0,
            ),
            const SizedBox(height: 10.0),
            kloadingText,
          ],
        ),
      ),
    );
  }
}

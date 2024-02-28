// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
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
  LocationService locationService = LocationService();
  late NetworkHelper networkHelper;
  @override
  void initState() {
    super.initState();
    // run resultpage immediately after retrieving data
    getLocationAndNavigate();
  }

  void getLocationAndNavigate() async {
    await locationService.getCurrentLocation();
    networkHelper = NetworkHelper(
      latitude: locationService.getLatitude(),
      longitude: locationService.getLongitude(),
    );

    var data = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ResultPage(data: data);
    }));
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

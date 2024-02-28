import 'package:flutter/material.dart';
import 'package:weather_app/screens/loading_screen.dart';
import 'utilities/constant.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: kCloudyBackground,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white, size: 25.0)),
      home: const LoadingScreen(),
    );
  }
}

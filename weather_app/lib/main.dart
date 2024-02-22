import 'package:flutter/material.dart';
import 'package:weather_app/screens/loading_screen.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF41DCBB),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 22.0,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      home: const LoadingScreen(),
    );
  }
}

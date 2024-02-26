import 'package:flutter/material.dart';
import 'package:weather_app/screens/loading_screen.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7C9A7),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      home: const LoadingScreen(),
    );
  }
}

import 'package:flutter/material.dart';

const kloadingText = Text(
  'Loading weather data... \nAlmost there!',
  style: TextStyle(color: Colors.white),
  textAlign: TextAlign.center,
);

const String kAPIKey = '49cb3d1878da8308d154e3da86b3fca6';
const Color kSunnyColor = Color(0xFFD02A02);
const Color kSubLabelColor = Color.fromARGB(255, 223, 159, 145);
const Color kCloudyBackground = Color(0xFFF7C9A7);

const Icon kAirIcon = Icon(
  Icons.air,
  color: kSubLabelColor,
);

const TextStyle kSubLabelStyle = TextStyle(
  color: kSubLabelColor,
  fontSize: 14.0,
);

Uri kLatLongURL(double latitude, double longitude) {
  return Uri.https('api.openweathermap.org', '/data/2.5/forecast', {
    'lat': latitude.toString(),
    'lon': longitude.toString(),
    'appid': kAPIKey,
  });
}

Uri kCityUrl(String cityName) {
  return Uri.https('api.openweathermap.org', '/data/2.5/forecast', {
    'q': cityName,
    'appid': kAPIKey,
  });
}

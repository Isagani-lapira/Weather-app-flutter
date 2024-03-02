import 'dart:ui';

import 'package:weather_app/utilities/constant.dart';

class WeatherModel {
  final double temp;
  final String weatherDesc;
  final double windSpeed;
  final String weatherMain;
  final String weatherIcon;
  final String cityName;
  final String countryName;

  WeatherModel({
    required this.temp,
    required this.windSpeed,
    required this.weatherDesc,
    required this.weatherMain,
    required this.cityName,
    required this.countryName,
    required this.weatherIcon,
  });

  static String getWeatherIcon(String weather) {
    String weatherImage = '';
    switch (weather) {
      case 'Rain':
        weatherImage = 'rainy.png';
        break;
      case 'Snow':
        weatherImage = 'snowy.png';
        break;
      case 'Thunderstorm':
        weatherImage = 'thunder_storm.png';
        break;
      case 'Clear':
        weatherImage = 'sunny.png';
        break;
      case 'Drizzle':
        weatherImage = 'drizzle.png';
        break;
      default:
        weatherImage = 'cloudy.png';
        break;
    }

    return weatherImage;
  }

  static Color getWeatherColor(String weather) {
    Color weatherImage;
    switch (weather) {
      case 'Rain':
        weatherImage = kRainyBackground;
        break;
      case 'Snow':
        weatherImage = kSnowyBackground;
        break;
      case 'Thunderstorm':
        weatherImage = kThunderBackground;
        break;
      case 'Clear':
        weatherImage = kSunnyColor;
        break;
      case 'Drizzle':
        weatherImage = kDrizzleBackground;
        break;
      default:
        weatherImage = kCloudyBackground;
        break;
    }

    return weatherImage;
  }
}

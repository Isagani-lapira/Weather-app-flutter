class WeatherModel {
  final int temp;
  final String weatherDesc;
  final double windSpeed;
  final String weatherMain;
  final String cityName;

  WeatherModel({
    required this.temp,
    required this.windSpeed,
    required this.weatherDesc,
    required this.weatherMain,
    required this.cityName,
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
}

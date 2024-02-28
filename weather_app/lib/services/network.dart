import 'package:weather_app/model/weather_model.dart';

import '../utilities/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final double latitude;
  final double longitude;

  const NetworkHelper({required this.latitude, required this.longitude});
  Future getData() async {
    var url = Uri.https('api.openweathermap.org', '/data/2.5/forecast', {
      'lat': latitude.toString(),
      'lon': longitude.toString(),
      'appid': kAPIKey,
      'units': 'metric' //for celcius
    });
    http.Response response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<WeatherModel> forecast = [];
        String cityName = data['city']['name'];
        for (var item in data['list']) {
          WeatherModel weatherModel = WeatherModel(
            temp: item['main']['temp'].round(),
            windSpeed: item['wind']['speed'],
            weatherDesc: item['weather'][0]['description'],
            weatherMain: WeatherModel.getWeatherIcon(
              item['weather'][0]['main'],
            ),
            cityName: cityName,
          );
          forecast.add(weatherModel);
        }

        return forecast;
      }
    } catch (e) {
      print(e);
    }
  }
}

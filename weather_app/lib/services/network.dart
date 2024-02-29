import 'package:weather_app/model/weather_model.dart';

import '../utilities/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final double? latitude;
  final double? longitude;
  final String? cityName;

  const NetworkHelper({
    this.latitude,
    this.longitude,
    this.cityName,
  });

  Future getData() async {
    // check what url to be use with city name or lat and longitude
    var url = (cityName != null)
        ? kCityUrl(cityName!)
        : kLatLongURL(latitude!, longitude!);

    http.Response response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<WeatherModel> forecast = [];
        String cityName = data['city']['name'];
        String country = data['city']['country'];
        for (var item in data['list']) {
          WeatherModel weatherModel = WeatherModel(
              temp: (item['main']['temp'] - 273.15),
              windSpeed: item['wind']['speed'],
              weatherDesc: item['weather'][0]['description'],
              weatherMain: WeatherModel.getWeatherIcon(
                item['weather'][0]['main'],
              ),
              cityName: cityName,
              countryName: country);
          forecast.add(weatherModel);
        }

        return forecast;
      }
    } catch (e) {
      print(e);
    }
  }
}

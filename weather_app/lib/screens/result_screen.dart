import 'package:flutter/material.dart';
import 'package:weather_app/screens/search_city_screen.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/services/network.dart';
import 'package:weather_app/widgets/weather_widget.dart';

import '../model/weather_model.dart';

class ResultPage extends StatefulWidget {
  final List<WeatherModel> data;
  const ResultPage({super.key, required this.data});
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late double temperatureVal;
  late double windSpeedVal;
  late String weatherMain;
  late String weatherDesc;
  late String cityName;
  late String countryName;
  late String weatherIcon;
  LocationService locationService = LocationService();
  late NetworkHelper networkHelper;

  @override
  void initState() {
    super.initState();
    temperatureVal = widget.data[0].temp;
    windSpeedVal = widget.data[0].windSpeed;
    weatherMain = widget.data[0].weatherMain;
    weatherIcon = widget.data[0].weatherIcon;
    cityName = widget.data[0].cityName;
    weatherDesc = widget.data[0].weatherDesc;
    countryName = widget.data[0].countryName;
  }

  void updateData() async {
    var data = await networkHelper.getData();
    setState(() {
      temperatureVal = data[0].temp;
      windSpeedVal = data[0].windSpeed;
      weatherMain = data[0].weatherMain;
      weatherDesc = data[0].weatherDesc;
      cityName = data[0].cityName;
      countryName = data[0].countryName;
      weatherIcon = data[0].weatherIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WeatherModel.getWeatherColor(weatherMain),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () async {
                        await locationService.getCurrentLocation();
                        networkHelper = NetworkHelper(
                          latitude: locationService.getLatitude(),
                          longitude: locationService.getLongitude(),
                        );
                        updateData();
                      },
                      child: const Icon(
                        Icons.sync,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      '$cityName \n$countryName',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () async {
                        //open search city page
                        String cityName = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SearchCity();
                        }));

                        if (cityName != '') {
                          networkHelper = NetworkHelper(cityName: cityName);
                          updateData();
                        }
                      },
                      child: const Icon(
                        Icons.location_city,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: WeatherWidget(
                  temp: temperatureVal,
                  windSpeed: windSpeedVal,
                  weatherIcon: weatherIcon,
                  weatherDesc: weatherDesc,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

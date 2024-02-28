import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constant.dart';
import 'package:weather_app/widgets/weather_widget.dart';

import '../model/weather_model.dart';

class ResultPage extends StatefulWidget {
  final List<WeatherModel> data;
  const ResultPage({super.key, required this.data});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late int temperatureVal;
  late double windSpeedVal;
  late String weatherMain;
  @override
  void initState() {
    super.initState();
    temperatureVal = widget.data[0].temp.toInt();
    windSpeedVal = widget.data[0].windSpeed;
    weatherMain = widget.data[0].weatherMain;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSunnyColor,
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
                      onTap: () {},
                      child: const Icon(
                        Icons.sync,
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 3,
                    child: Text(
                      'Sydney',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.location_city,
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: WeatherWidget(
                  temp: temperatureVal,
                  windSpeed: windSpeedVal,
                  weatherMain: weatherMain,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

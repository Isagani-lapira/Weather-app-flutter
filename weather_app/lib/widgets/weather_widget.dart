import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utilities/constant.dart';

class WeatherWidget extends StatefulWidget {
  final double temp;
  final double windSpeed;
  final String weatherMain;
  final String weatherDesc;
  const WeatherWidget({
    super.key,
    required this.temp,
    required this.windSpeed,
    required this.weatherMain,
    required this.weatherDesc,
  });

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/image/${widget.weatherMain}',
          fit: BoxFit.contain,
          height: 150.0,
          width: 150.0,
        ),
        Text(
          '${widget.temp.toStringAsFixed(2)}°',
          style: GoogleFonts.ptSerif(
            fontSize: 52.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          widget.weatherDesc,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  kAirIcon,
                  Text(
                    '${widget.windSpeed} km/h',
                    style: kSubLabelStyle,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

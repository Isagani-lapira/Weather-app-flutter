import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utilities/constant.dart';

class WeatherWidget extends StatefulWidget {
  final int temp;
  final double windSpeed;
  final String weatherMain;
  const WeatherWidget({
    super.key,
    required this.temp,
    required this.windSpeed,
    required this.weatherMain,
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
          '${widget.temp}°',
          style: GoogleFonts.ptSerif(
            fontSize: 52.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        const Text(
          'The floor is lava',
          style: TextStyle(fontWeight: FontWeight.w500),
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

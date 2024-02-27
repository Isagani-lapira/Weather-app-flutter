import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constant.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSunnyColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.sync,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Sydney',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.location_city,
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/sunny.png',
                      fit: BoxFit.contain,
                      height: 150.0,
                      width: 150.0,
                    ),
                    Text(
                      '34°',
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
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(
                                Icons.air,
                                color: kSubLabelColor,
                              ),
                              Text(
                                '5 km/h',
                                style: TextStyle(
                                  color: kSubLabelColor,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

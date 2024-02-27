import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD02A02),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.sync,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Sydney',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
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
                                color: Color.fromARGB(255, 223, 159, 145),
                              ),
                              Text(
                                '5 km/h',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 223, 159, 145),
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

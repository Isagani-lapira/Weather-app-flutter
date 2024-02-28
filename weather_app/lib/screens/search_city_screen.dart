import 'package:flutter/material.dart';

class SearchCity extends StatelessWidget {
  const SearchCity({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double oneFourthWidth = screenWidth * 0.8;
    double halfSizeWidth = screenWidth / 2;
    String inputData = '';

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: oneFourthWidth,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter any city...',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                cursorColor: Colors.white,
                onChanged: (value) => inputData = value,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              width: halfSizeWidth,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, inputData);
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                child: const Text('Search city weather'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

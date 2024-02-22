import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utilities/constant.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(
              animating: true,
              radius: 50,
              color: Colors.white,
            ),
            loadingText,
          ],
        ),
      ),
    );
  }
}

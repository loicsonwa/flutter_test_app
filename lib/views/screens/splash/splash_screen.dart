import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test_app/constants/dimensions.dart';
import 'package:flutter_test_app/constants/router/routes.dart';
import 'package:flutter_test_app/constants/theme/color.dart';
import 'package:flutter_test_app/constants/theme/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void initState() {
    navigateToHome();
    super.initState();
  }
@override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 16, right: 16),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Welcome to my",
                  style: prodRegular.copyWith(
                      color: black, fontSize: Dimensions.fontSizeLarge),
                ),
                TextSpan(
                  text: "\n Flutter Test App ",
                  style: prodRegular.copyWith(
                      fontWeight: FontWeight.w700,
                      color: black,
                      fontSize: Dimensions.fontSizeOverLarge),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToHome() {
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      Navigator.pushReplacementNamed(context, Routes.HOME);
    });
  }
}

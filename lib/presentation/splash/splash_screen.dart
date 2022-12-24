import 'dart:async';

import 'package:cleanarchmvvm/presentation/resources/assets_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/color_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  timerCountDown() {
    timer = Timer(const Duration(seconds: 2), goTo);
  }

  goTo() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingScreen);
  }

  @override
  void initState() {
    super.initState();
    timerCountDown();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body:
          const Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
    );
  }
}

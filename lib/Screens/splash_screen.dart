import 'dart:async';
import 'package:emarket/Screens/onboarding.dart';
import 'package:emarket/Utils/screen_strings.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const OnBoardingScreen())));
    return Scaffold(
        backgroundColor: HexColor("#5aaf49") ,
        body: SafeArea(
          child: Center(
            child: Image.asset(logo),
          ),
        ));
  }
}

import 'package:emarket/Utils/screen_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'login.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.green));
    return Scaffold(
        body: SafeArea(
      child: IntroductionScreen(
        globalBackgroundColor: Colors.green,
        pages: pages(),
        onDone: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        },
        onSkip: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        },
        showBackButton: false,
        showSkipButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        next: const Text(
          "Next",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        done: const Text("Finish",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        dotsDecorator: const DotsDecorator(
          size: Size.square(10.0),
          activeSize: Size(20.0, 10.0),
          color: Colors.white,
          spacing: EdgeInsets.symmetric(horizontal: 3.0),
          activeColor: Colors.orange,
        ),
      ),
    ));
  }
}

List<PageViewModel> pages() {
  return [
    PageViewModel(
        image: Center(
            child: Image(
          image: AssetImage(marketing),
        )),
        title: "Our Products",
        body:
            "In our company, we have different products that you can choose from them. Our product are original and contains many features that can live with you for along time.",
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(color: Colors.white),
          bodyTextStyle: TextStyle(color: Colors.white70),
        )),
    PageViewModel(
        image: Center(
            child: Image(
          image: AssetImage(aboutUs),
        )),
        title: "About Us",
        body:
            "These are more than 100 people work with our company. We try to help everyone in everywhere. So, You can contact us through this email comany@gmail.com",
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(color: Colors.white),
          bodyTextStyle: TextStyle(color: Colors.white70),
        )),
  ];
}

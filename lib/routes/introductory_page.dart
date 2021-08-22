import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/OnbordingData.dart';
import 'package:flutter_onboarding_screen/flutteronboardingscreens.dart';
import 'package:ubuni_phone_app/routes/new_home_page.dart';

class IntroPage extends StatelessWidget {
  IntroPage({Key? key}) : super(key: key);

  final List<OnbordingData> list = [
    OnbordingData(
      imagePath: "assets/images/search.png",
      title: "Search",
      desc:
          "Discover different brands of phones, bookmark your favorite phones",
    ),
    OnbordingData(
      imagePath: "assets/images/buy.jpeg",
      title: "Buy",
      desc: "Buy your phone at live updated prices",
    ),
    OnbordingData(
      imagePath: "assets/images/deliver.png",
      title: "Deliver",
      desc: "Your phone is delivered, right at your front door!",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreen(
        list, MaterialPageRoute(builder: (context) => HomePage()));
  }
}

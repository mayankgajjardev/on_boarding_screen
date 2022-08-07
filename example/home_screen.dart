import 'package:flutter/material.dart';
import 'package:onboarding_intro_screen/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return OnBoardingScreen(
      onSkip: () {
        debugPrint("On Skip Called....");
      },
      showPrevNextButton: true,
      showIndicator: true,
      backgourndColor: Colors.white,
      activeDotColor: Colors.blue,
      deactiveDotColor: Colors.grey,
      iconColor: Colors.black,
      leftIcon: Icons.arrow_circle_left_rounded,
      rightIcon: Icons.arrow_circle_right_rounded,
      iconSize: 30,
      pages: [
        OnBoardingModel(
          image: Image.asset("assets/images/img1.png"),
          title: "Business Chat",
          body:
              "First impressions are everything in business, even in chat service. It’s important to show professionalism and courtesy from the start",
        ),
        OnBoardingModel(
          image: Image.asset("assets/images/img3.png"),
          title: "Coffee With Friends",
          body:
              "When your morning starts with a cup of coffee and you are used to survive the day with the same, then all your Instagram stories and snapchat streaks would stay filled up with coffee pictures",
        ),
        OnBoardingModel(
          image: Image.asset("assets/images/img6.png"),
          title: "Mobile Application",
          body:
              "Mobile content marketing has also been found to enhance quick online actions and make follow-ups easier.",
        ),
        OnBoardingModel(
          image: Image.asset("assets/images/img4.png"),
          title: "Content Team",
          body: "No two content marketing teams look the same.",
        ),
      ],
    );
  }
}

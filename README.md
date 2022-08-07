<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Use this package for introduction screen like on onboarding.


## Installation

for installation add onboarding_screen package in pubspec.yaml file. 


## Features 

This is the example of on boarding screen.
for starting screen

https://user-images.githubusercontent.com/78218862/183291883-edd54d91-4de6-43fc-980f-d9ec372c96ea.mp4


## Getting started

First of all,
    add this package in your project pubspec.yaml file.
    and use for OnBoardingScreen model class and applay other functionality.
    


## Usage

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
                ],
            );
        }
    }


    OnBoardingModel(
        image: Image.asset("assets/images/img1.png"),
        title: "Business Chat",
        body:
            "First impressions are everything in business, even in chat service. It’s important to show professionalism and courtesy from the start",
    ),

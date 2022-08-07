library onboarding_screen;

import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  // Background Color
  final Color? backgourndColor;

  // Page List of OnBoardingModel class
  final List<OnBoardingModel> pages;

  // Left Side Icon
  final IconData? leftIcon;

  // Right Side Icon
  final IconData? rightIcon;

  // OnSkip callback
  final VoidCallback onSkip;

  // Animation Duration
  final Duration animationDuration;

  // Icon Size
  final double? iconSize;

  // Icon Color
  final Color? iconColor;

  // Actie Indicator Color
  final Color? activeDotColor;

  // Deactive Indicator Color
  final Color? deactiveDotColor;

  // Show Previous/Next Icons
  final bool? showPrevNextButton;

  // Show Bottom Indicator
  final bool? showIndicator;

  OnBoardingScreen({
    Key? key,
    required this.pages,
    required this.onSkip,
    this.backgourndColor = Colors.white,
    this.leftIcon = Icons.arrow_circle_left_rounded,
    this.rightIcon = Icons.arrow_circle_right_rounded,
    this.animationDuration = const Duration(milliseconds: 400),
    this.iconSize = 30,
    this.iconColor = Colors.black,
    this.showPrevNextButton = false,
    this.showIndicator = true,
    this.activeDotColor = Colors.blue,
    this.deactiveDotColor = Colors.grey,
  })  : assert(pages.length <= 12,
            (throw Exception("Page Length Must be less than 12"))),
        super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  final _curve = Curves.easeInOut;
  final _overlayColor = MaterialStateProperty.all(Colors.transparent);

  _nextPage() {
    _pageController.nextPage(
      duration: widget.animationDuration,
      curve: _curve,
    );
  }

  _previousPage() {
    _pageController.previousPage(
      duration: widget.animationDuration,
      curve: _curve,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: widget.backgourndColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 20, top: 15),
              alignment: Alignment.centerRight,
              child: InkWell(
                overlayColor: _overlayColor,
                onTap: widget.onSkip,
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                children: widget.pages,
              ),
            ),
            widget.showPrevNextButton == false && widget.showIndicator == false
                ? const SizedBox()
                : SizedBox(
                    height: size.height * 0.1,
                    width: size.width,
                    child: Row(
                      children: [
                        widget.showPrevNextButton == false
                            ? const SizedBox()
                            : Expanded(
                                flex: 2,
                                child: currentIndex == 0
                                    ? const SizedBox()
                                    : InkWell(
                                        overlayColor: _overlayColor,
                                        onTap: _previousPage,
                                        child: Icon(
                                          widget.leftIcon,
                                          size: widget.iconSize,
                                          color: widget.iconColor,
                                        ),
                                      ),
                              ),
                        widget.showIndicator == false
                            ? const SizedBox()
                            : Expanded(
                                flex: 6,
                                child: Indicator(
                                  pageLenth: widget.pages.length,
                                  currentIndex: currentIndex,
                                  animatioDuration: widget.animationDuration,
                                  curve: _curve,
                                  activeDotColor: widget.activeDotColor,
                                  deactiveDotColor: widget.deactiveDotColor,
                                ),
                              ),

                        // Next Text
                        widget.showPrevNextButton == false
                            ? const SizedBox()
                            : Expanded(
                                flex: 2,
                                child: currentIndex + 1 == widget.pages.length
                                    ? const SizedBox()
                                    : InkWell(
                                        overlayColor: _overlayColor,
                                        onTap: _nextPage,
                                        child: Icon(
                                          widget.rightIcon,
                                          size: widget.iconSize,
                                          color: widget.iconColor,
                                        ),
                                      ),
                              )
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

// Indicator Class
class Indicator extends StatelessWidget {
  final int pageLenth;
  final int currentIndex;
  final Duration? animatioDuration;
  final Curve? curve;
  final Color? activeDotColor;
  final Color? deactiveDotColor;

  const Indicator({
    Key? key,
    required this.pageLenth,
    required this.currentIndex,
    required this.animatioDuration,
    required this.curve,
    required this.activeDotColor,
    required this.deactiveDotColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageLenth,
        (index) => Row(
          children: [
            AnimatedContainer(
              duration: animatioDuration!,
              curve: curve!,
              height: 10,
              width: index == currentIndex ? 20 : 10,
              decoration: BoxDecoration(
                color:
                    index == currentIndex ? activeDotColor : deactiveDotColor,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            const SizedBox(width: 5)
          ],
        ),
      ),
    );
  }
}

// OnBoarding Model Class
class OnBoardingModel extends StatelessWidget {
  final String? title;
  final String? body;
  final Widget? image;
  final double? titleFontSize;
  final double? bodyFontSize;
  final FontWeight? titleFontWeight;
  final FontWeight? bodyFontWeight;
  final Color? titleColor;
  final Color? bodyColor;

  const OnBoardingModel({
    Key? key,
    this.title,
    this.body,
    this.image,
    this.titleFontSize = 22,
    this.bodyFontSize = 16,
    this.titleFontWeight = FontWeight.bold,
    this.bodyFontWeight = FontWeight.normal,
    this.titleColor = Colors.black,
    this.bodyColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 10,
          child: SizedBox(
            child: image!,
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                // Title Text
                Expanded(
                  child: Text(
                    title!,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    style: TextStyle(
                      color: titleColor,
                      fontSize: titleFontSize,
                      fontWeight: titleFontWeight,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Body Text
                Expanded(
                  child: Text(
                    body!,
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    textScaleFactor: 0.9,
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    style: TextStyle(
                      color: bodyColor,
                      fontSize: bodyFontSize,
                      fontWeight: bodyFontWeight,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        )
      ],
    );
  }
}

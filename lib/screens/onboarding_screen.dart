import 'package:flutter/material.dart';
import 'package:learnwithprime/main.dart';
import 'package:learnwithprime/screens/intro_screen1.dart';
import 'package:learnwithprime/screens/intro_screen2.dart';
import 'package:learnwithprime/screens/intro_screen3.dart';
import 'package:learnwithprime/screens/role_selection.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // controller that keeps tracks of pages
  final PageController controller = PageController();

  // keeping track if we are on the last page
  bool onlastpage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                onlastpage = (index == 2);
              });
            },
            children: [IntroScreen1(), IntroScreen2(), IntroScreen3()],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Text(
                    'Skip',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    controller.jumpToPage(2);
                  },
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: WormEffect(
                    activeDotColor: primaryColor,
                    dotColor: accentColor,
                    dotHeight: 18,
                    dotWidth: 18,
                  ),
                ),
                onlastpage
                    ? GestureDetector(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RoleSelectionScreen();
                              },
                            ),
                          );
                        },
                      )
                    : GestureDetector(
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          controller.nextPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                          );
                        },
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

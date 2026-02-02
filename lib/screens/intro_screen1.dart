import 'package:flutter/material.dart';
import 'package:learnwithprime/main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/image1.svg',
                width: 500,
                height: 300,
              ),
              SizedBox(height: 70),

              Text(
                'Study Smarter, Not Harder',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Get exam-focused lessons, quizzes, and study plans tailored to your subjects and goals - whether it’s JAMB, WAEC, or GCE.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';


const Color primaryColor = Color(0xFF6C63FF);
const Color accentColor = Color(0xFFE2E0FF);
const Color backgroundColor =  Colors.white;



void main() {
  runApp(Learnwithprime());
}

class Learnwithprime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LearnWithPrime',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: 'Poppins',
      ),
      home: SplashScreen(),
    );
  }
}

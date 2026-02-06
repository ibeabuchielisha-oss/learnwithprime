import 'package:flutter/material.dart';
import 'register_success_screen.dart';

class RegisterLoadingScreen extends StatefulWidget {
  const RegisterLoadingScreen({super.key});

  @override
  State<RegisterLoadingScreen> createState() => _RegisterLoadingScreenState();
}

class _RegisterLoadingScreenState extends State<RegisterLoadingScreen> {
  @override
  void initState() {
    super.initState();

    _simulateRegistration();
  }

  Future<void> _simulateRegistration() async {
    // 🔥 Replace this with your real API / Firebase call later
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const RegisterSuccessScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(
              'Creating your account...',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
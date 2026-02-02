import 'package:flutter/material.dart';
import 'package:learnwithprime/screens/Login_screen.dart';
import 'package:learnwithprime/screens/Register_screen3.dart';

class RegisterScreen2 extends StatefulWidget {
  const RegisterScreen2({super.key});

  @override
  State<RegisterScreen2> createState() => _RegisterScreen2State();
}

class _RegisterScreen2State extends State<RegisterScreen2> {
  String selectedStudentType = '';
  final List<String> selectedExams = [];

  final List<String> studentTypes = ['Science', 'Art', 'Commercial'];
  final List<String> exams = ['JAMB', 'NECO', 'GCE', 'WAEC', 'Nursing Exams'];

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              /// Title
              const Text(
                'What type of student are you?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              const Text(
                'Choose the category that best matches your subjects.',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(height: 30),

              /// Student Type (Single Select)
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: studentTypes.map((type) {
                  final isSelected = selectedStudentType == type;

                  return ChoiceChip(
                    label: Text(type),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() => selectedStudentType = type);
                    },
                    selectedColor: primaryColor,
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                    shape: StadiumBorder(side: BorderSide(color: primaryColor)),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 42),

              /// Target Exams Title
              const Text(
                'Target Exams',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              const Text(
                "Select all exams you're preparing for.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(height: 20),

              /// Target Exams (Multi Select)
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: exams.map((exam) {
                  final isSelected = selectedExams.contains(exam);

                  return FilterChip(
                    label: Text(exam),
                    selected: isSelected,
                    onSelected: (value) {
                      setState(() {
                        value
                            ? selectedExams.add(exam)
                            : selectedExams.remove(exam);
                      });
                    },
                    selectedColor: primaryColor,
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                    shape: StadiumBorder(side: BorderSide(color: primaryColor)),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 26,
                      vertical: 12,
                    ),
                  );
                }).toList(),
              ),

              SizedBox(height: 90),

              /// Continue Button
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: selectedStudentType.isEmpty
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => RegisterScreen3(),
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    disabledBackgroundColor: primaryColor.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// Sign in text
              Center(
                child: GestureDetector(
                  onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LoginScreen()),
                        );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: const TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

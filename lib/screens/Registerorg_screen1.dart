import 'package:flutter/material.dart';
import 'package:learnwithprime/main.dart';
import 'package:learnwithprime/screens/Login_screen.dart';
import 'package:learnwithprime/screens/Registerorg_screen2.dart';

class RegisterorgScreen1 extends StatefulWidget {
  const RegisterorgScreen1({super.key});

  @override
  State<RegisterorgScreen1> createState() => _RegisterorgScreen1State();
}

class _RegisterorgScreen1State extends State<RegisterorgScreen1> {
  final _formKey = GlobalKey<FormState>();

  final fullnameController = TextEditingController();
  final orgnameController = TextEditingController();
  final emailController = TextEditingController();
  final CACController = TextEditingController();

  @override
  void dispose() {
    fullnameController.dispose();
    orgnameController.dispose();
    emailController.dispose();
    CACController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.fromLTRB(
            24,
            0,
            24,
            MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                const Text(
                  'Create Account',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Fill your information below to create your account.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),

                const SizedBox(height: 32),

                buildTextField(
                  label: 'Fullname',
                  hint: 'e.g john doe',
                  controller: fullnameController,
                ),

                const SizedBox(height: 16),

                buildTextField(
                  label: 'Organization Name',
                  hint: 'e.g LearnWithPrime',
                  controller: orgnameController,
                ),

                const SizedBox(height: 16),

                buildTextField(
                  label: 'Email Address',
                  hint: 'e.g elisha@gmail.com',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 16),

                buildTextField(
                  label: 'CAC Number',
                  hint: 'Enter your CAC number',
                  controller: CACController,
                  keyboardType: TextInputType.phone,
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(fullnameController.text);
                        print(orgnameController.text);
                        print(emailController.text);
                        print(CACController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RegisterorgScreen2(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                      );
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: 'Already have an account? ',
                        children: [
                          TextSpan(
                            text: 'Sign in',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade100,
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}

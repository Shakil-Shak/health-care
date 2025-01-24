import 'package:flutter/material.dart';
import 'package:health_care/const/assets/icons.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/components/custom_button.dart';
import 'package:health_care/view/components/custom_text.dart';
import 'package:health_care/view/components/custom_textfield.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              commonText('Sign Up for Free',
                  color: AppColor.primaryColor, size: 32, isBold: true),
              const SizedBox(height: 30),
              commonTextfield(usernameController,
                  hintText: 'Username',
                  prifixIconWidget: const Icon(Icons.person)),
              const SizedBox(height: 20),
              commonTextfield(emailController,
                  hintText: 'Email', prifixIconWidget: const Icon(Icons.email)),
              const SizedBox(height: 20),
              commonTextfield(passwordController,
                  hintText: 'Password',
                  isPasswordVisible: true,
                  issuffixIconVisible: true,
                  prifixIconWidget: const Icon(Icons.lock),
                  changePasswordVisibility: () {}),
              const SizedBox(height: 20),
              commonTextfield(confirmPasswordController,
                  hintText: 'Confirm Password',
                  isPasswordVisible: true,
                  issuffixIconVisible: true,
                  prifixIconWidget: const Icon(Icons.lock),
                  changePasswordVisibility: () {}),
              const SizedBox(height: 20),
              commonTextfield(contactNumberController,
                  hintText: 'Contact Number',
                  prifixIconWidget: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 10),
                      Image.asset(
                        AppIcons.america,
                        height: 25,
                      ),
                      const SizedBox(width: 5),
                    ],
                  )),
              const SizedBox(height: 40),
              commonButton("Sign up", isBold: true, textSize: 16),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: AppColor.primaryColorLight2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppIcons.google,
                      height: 25,
                    ),
                    const SizedBox(width: 10),
                    commonText(
                      'Sign up with Google',
                      isBold: true,
                      color: Colors.black,
                      size: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: const Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
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

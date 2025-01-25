import 'package:flutter/material.dart';
import 'package:health_care/const/assets/icons.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/auth/signUp/forget_password_page.dart';
import 'package:health_care/view/components/custom_button.dart';
import 'package:health_care/view/components/custom_text.dart';
import 'package:health_care/view/components/custom_textfield.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();

  SignInPage({super.key});

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
              commonText('Login to Your Account',
                  color: AppColor.primaryColor, size: 32, isBold: true),
              const SizedBox(height: 30),
              commonTextfield(emailController,
                  hintText: 'Email', prifixIconWidget: const Icon(Icons.email)),
              const SizedBox(height: 20),
              commonTextfield(passwordController,
                  hintText: 'Password',
                  isPasswordVisible: true,
                  issuffixIconVisible: true,
                  prifixIconWidget: const Icon(Icons.lock),
                  changePasswordVisibility: () {}),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPasswordPage()),
                      );
                    },
                    child: commonText("Forgot Password?",
                        size: 16,
                        color: const Color.fromRGBO(246, 110, 16, 1),
                        isBold: true),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              commonButton("Sign in", isBold: true, textSize: 16),
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
                      'Sign in with Google',
                      isBold: true,
                      color: Colors.black,
                      size: 16,
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 20),
              // Center(
              //   child: GestureDetector(
              //     onTap: () {},
              //     child: const Text.rich(
              //       TextSpan(
              //         text: 'Don’t have an account? ',
              //         style: TextStyle(color: Colors.black),
              //         children: [
              //           TextSpan(
              //             text: 'Sign up',
              //             style: TextStyle(
              //               color: Colors.red,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

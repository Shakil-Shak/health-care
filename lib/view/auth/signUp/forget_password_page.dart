import 'package:flutter/material.dart';
import 'package:health_care/const/assets/images.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/auth/signUp/otp_verify_page.dart';
import 'package:health_care/view/components/custom_button.dart';
import 'package:health_care/view/components/custom_text.dart';
import 'package:health_care/view/components/custom_textfield.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController forgetPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.forgetPassword),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  commonText("Forgot Password?",
                      size: 32, color: AppColor.black, isBold: true),
                  const SizedBox(height: 10),
                  commonText("Enter your email to reset your password.",
                      size: 14, color: AppColor.black, isBold: false),
                  const SizedBox(height: 30),
                  commonTextfield(forgetPasswordController,
                      hintText: 'Email',
                      prifixIconWidget: const Icon(Icons.email)),
                  const SizedBox(height: 40),
                  commonButton(
                    "Continue",
                    isBold: true,
                    textSize: 16,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpVerifyPage()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

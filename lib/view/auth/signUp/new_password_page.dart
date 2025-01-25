import 'package:flutter/material.dart';
import 'package:health_care/const/assets/images.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/auth/signUp/otp_verify_page.dart';
import 'package:health_care/view/components/custom_button.dart';
import 'package:health_care/view/components/custom_text.dart';
import 'package:health_care/view/components/custom_textfield.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<NewPasswordPage> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Create New Password",
            color: AppColor.primaryColor, size: 24, isBold: true),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.changePassword),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  commonText("Create Your New Password",
                      size: 16, color: AppColor.black, isBold: true),
                  const SizedBox(height: 30),
                  commonTextfield(newPasswordController,
                      hintText: 'New Password',
                      isPasswordVisible: true,
                      issuffixIconVisible: true,
                      prifixIconWidget: const Icon(Icons.lock),
                      changePasswordVisibility: () {}),
                  const SizedBox(height: 15),
                  commonTextfield(confirmPasswordController,
                      hintText: 'Confirm New Password',
                      isPasswordVisible: true,
                      issuffixIconVisible: true,
                      prifixIconWidget: const Icon(Icons.lock),
                      changePasswordVisibility: () {}),
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

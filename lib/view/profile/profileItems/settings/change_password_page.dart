import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/controller/settings/change_password_controller.dart';
import 'package:health_care/view/auth/signUp/forget_password_page.dart';
import 'package:health_care/view/components/custom_button.dart';
import 'package:health_care/view/components/custom_text.dart';
import 'package:health_care/view/components/custom_textfield.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ChangePasswordController settingController =
      Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Change Password",
            color: AppColor.black, size: 20, isBold: true),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Form(
                  child: Column(
                children: [
                  commonTextfield(
                      hintText: "Current Password",
                      settingController.currentPassCtl.value,
                      isPasswordVisible: false,
                      issuffixIconVisible: true,
                      prifixIconWidget: const Icon(Icons.lock),
                      borderColor: Colors.transparent,
                      color: AppColor.primaryColorLight2),
                  const SizedBox(
                    height: 20,
                  ),
                  commonTextfield(
                      hintText: "New Password",
                      settingController.currentPassCtl.value,
                      isPasswordVisible: false,
                      issuffixIconVisible: true,
                      prifixIconWidget: const Icon(Icons.lock),
                      borderColor: Colors.transparent,
                      color: AppColor.primaryColorLight2),
                  const SizedBox(
                    height: 20,
                  ),
                  commonTextfield(
                      hintText: "Confirm new password",
                      settingController.currentPassCtl.value,
                      isPasswordVisible: false,
                      issuffixIconVisible: true,
                      prifixIconWidget: const Icon(Icons.lock),
                      borderColor: Colors.transparent,
                      color: AppColor.primaryColorLight2),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
              Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgetPasswordPage()),
                        );
                      },
                      child: commonText(
                        "Forgot the password?",
                        size: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryColor,
                      ))),
              const SizedBox(
                height: 20,
              ),
              commonButton(
                onTap: () {
                  Get.back();
                },
                "Confirm",
                textSize: 16,
                textColor: AppColor.white,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

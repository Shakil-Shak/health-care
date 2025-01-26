import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/controller/settings/change_password_controller.dart';
import 'package:health_care/view/components/custom_button.dart';
import 'package:health_care/view/components/custom_text.dart';
import 'package:health_care/view/components/custom_textfield.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ChangePasswordController settingController =
      Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Appointment Request",
            color: AppColor.primaryColor, size: 24, isBold: true),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                      isPasswordVisible: false),
                  const SizedBox(
                    height: 20,
                  ),
                  commonTextfield(
                      hintText: "New Password",
                      settingController.currentPassCtl.value,
                      isPasswordVisible: false),
                  const SizedBox(
                    height: 20,
                  ),
                  commonTextfield(
                      hintText: "Confirm new password",
                      settingController.currentPassCtl.value,
                      isPasswordVisible: false),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
              Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                      onPressed: () {
                        // Get.toNamed(AppRoute.forgetPassScreen);
                      },
                      child: commonText(
                        "Forgot the password?",
                        size: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryColor,
                      ))),
              const SizedBox(
                height: 30,
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/const/assets/images.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/controller/auth/signUp/otp_controller.dart';
import 'package:health_care/view/auth/signUp/new_password_page.dart';
import 'package:health_care/view/components/custom_button.dart';
import 'package:health_care/view/components/custom_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerifyPage extends StatefulWidget {
  const OtpVerifyPage({super.key});

  @override
  State<OtpVerifyPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<OtpVerifyPage> {
  TextEditingController otpController = TextEditingController();

  final OtpController forgetPasswordController = Get.put(OtpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: commonText("Verify Your Account",
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
                  Image.asset(AppImages.otp),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      commonText("We've Sent a Code to exa***@gmail.com",
                          size: 20,
                          color: AppColor.black,
                          isBold: true,
                          textAlign: TextAlign.center),
                      const SizedBox(height: 30),
                      PinCodeTextField(
                        controller: otpController,
                        appContext: context,
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          inactiveColor: AppColor.primaryColorLight,
                          inactiveFillColor: AppColor.white,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(16),
                          selectedFillColor: AppColor.white,
                          activeColor: AppColor.primaryColor,
                          selectedColor: AppColor.primaryColor,
                          borderWidth: 1,
                          activeBorderWidth: 1,
                          inactiveBorderWidth: 1,
                          fieldHeight: 70,
                          fieldWidth: 80,
                          activeFillColor: AppColor.white,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        beforeTextPaste: (text) {
                          return true;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => forgetPasswordController.otptimeOut.value !=
                                  0
                              ? commonText(
                                  "Resend code in ${forgetPasswordController.otptimeOut.value}s",
                                  isBold: true,
                                  size: 18)
                              : GestureDetector(
                                  onTap: () {
                                    forgetPasswordController
                                        .startOtpCountdown();
                                  },
                                  child: commonText(
                                    "Resend Otp",
                                  ))),
                        ],
                      ),
                      const SizedBox(height: 40),
                      commonButton(
                        "Confirm",
                        isBold: true,
                        textSize: 16,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewPasswordPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ]),
          ),
        ));
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> newPassController = TextEditingController().obs;
  Rx<TextEditingController> confirmPassController = TextEditingController().obs;
  Rx<TextEditingController> otpController = TextEditingController().obs;
  RxDouble otptimeOut = 60.0.obs;
  Timer? timer;

  //===============================================startOtpCountdown===============================>
  void startOtpCountdown() {
    if (timer != null) {
      timer!.cancel();
    }

    otptimeOut.value = 60.0;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (otptimeOut.value > 0) {
        otptimeOut.value--;
      } else {
        timer.cancel();
      }
    });
  }
}

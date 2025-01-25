import 'dart:async';

import 'package:get/get.dart';

class OtpController extends GetxController {
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

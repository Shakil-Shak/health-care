import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  Rx<TextEditingController> currentPassCtl = TextEditingController().obs;
  Rx<TextEditingController> newPassCtl = TextEditingController().obs;
  Rx<TextEditingController> confirmPassCtl = TextEditingController().obs;
}

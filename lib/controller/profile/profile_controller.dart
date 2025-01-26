import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //===========================================for edit profile

  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> mailController = TextEditingController().obs;
  Rx<TextEditingController> adressController = TextEditingController().obs;
  Rx<TextEditingController> contactPassController = TextEditingController().obs;
  Rx<TextEditingController> gender = TextEditingController().obs;
  Rx<TextEditingController> dateOfBirth = TextEditingController().obs;
  Rx<TextEditingController> height = TextEditingController().obs;
  Rx<TextEditingController> weight = TextEditingController().obs;
  Rx<TextEditingController> medical = TextEditingController().obs;
  RxString selectedGender = "".obs;
  File? healthDoc;
}

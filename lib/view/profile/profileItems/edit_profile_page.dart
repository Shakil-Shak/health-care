import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:health_care/const/assets/icons.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/controller/profile/profile_controller.dart';
import 'package:health_care/view/components/custom_button.dart';
import 'package:health_care/view/components/custom_text.dart';
import 'package:health_care/view/components/custom_textfield.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Edit Profile",
            color: AppColor.primaryColor, size: 24, isBold: true),
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
                  key: formKey,
                  child: Column(
                    children: [
                      fieldHeading(title: "Full Name"),
                      commonTextfield(
                        profileController.fullNameController.value,
                        hintText: "Enter Your Full Name",
                        // validator: (value) => OtherHelper.validator(value),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      fieldHeading(title: "Email"),
                      commonTextfield(
                        profileController.mailController.value,
                        hintText: "Enter Your Email Here",

                        // validator: (value) => OtherHelper.emailValidator(value),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      fieldHeading(title: "Contact Number"),
                      SizedBox(
                        height: 65,
                        child: IntlPhoneField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: AppColor.primaryColor, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: AppColor.primaryColor, width: 1),
                            ),
                          ),
                          initialCountryCode: 'BD',
                          onChanged: (phone) {
                            profileController.contactPassController.value.text =
                                phone.completeNumber;
                          },
                          style: const TextStyle(color: Colors.black),
                          dropdownTextStyle:
                              const TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      fieldHeading(title: "Address"),
                      commonTextfield(
                        profileController.adressController.value,
                        hintText: "Enter Your Address",
                        // validator: (value) => OtherHelper.emailValidator(value),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      fieldHeading(title: "Gender"),
                      Obx(() {
                        return Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppColor.primaryColor),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value:
                                  profileController.selectedGender.value.isEmpty
                                      ? null
                                      : profileController.selectedGender.value,
                              items: ['Male', 'Female', 'Other']
                                  .map(
                                    (gender) => DropdownMenuItem<String>(
                                      value: gender,
                                      child: Text(gender),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  profileController.selectedGender.value =
                                      value;
                                  profileController.gender.value.text = value;
                                }
                              },
                              hint: const Text("Select Gender"),
                              icon: const Icon(Icons.keyboard_arrow_down),
                            ),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      fieldHeading(title: "Date of Birth"),
                      commonTextfield(
                        profileController.dateOfBirth.value,
                        hintText: "DD/MM/YY",
                        isPasswordVisible: false,
                        suffinxIcon: Padding(
                          padding: const EdgeInsets.all(16),
                          child: InkWell(
                              onTap: () {
                                // OtherHelper.datePicker(
                                //     profileController.dateOfBirth.value);
                              },
                              child: SvgPicture.asset(
                                AppIcons.calender,
                                height: 20,
                                width: 20,
                              )),
                        ),
                        // validator: (value) => OtherHelper.validator(value),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      fieldHeading(title: "Height"),
                      commonTextfield(
                        profileController.height.value,
                        hintText: "Enter your height",
                        // validator: (value) => OtherHelper.validator(value),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      fieldHeading(title: "Weight"),
                      commonTextfield(
                        profileController.weight.value,
                        hintText: "Enter your weight",
                        // validator: (value) => OtherHelper.validator(value),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      fieldHeading(title: "Medical Condition"),
                      commonTextfield(
                        profileController.fullNameController.value,
                        hintText: "Breathing Problem and chest pain.",
                        // validator: (value) => OtherHelper.validator(value),
                        maxLine: 4,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      fieldHeading(title: "Update Heath Document"),
                      DottedBorder(
                          color: AppColor.primaryColor,
                          strokeCap: StrokeCap.butt,
                          dashPattern: [
                            10,
                          ],
                          radius: const Radius.circular(10),
                          child: SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppIcons.pickFile),
                                  const SizedBox(width: 5),
                                  commonText(
                                    "Upload file",
                                    size: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.primaryColor,
                                  ),
                                ],
                              )))),
                      const SizedBox(
                        height: 30,
                      ),
                      commonButton(
                        onTap: () {
                          // Get.offAllNamed(AppRoute.bottomNavScreen);
                        },
                        "Save Changes",
                        textSize: 16,
                        color: AppColor.primaryColor,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget fieldHeading({required String title}) {
    return Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            commonText(
              title,
              size: 20,
              fontWeight: FontWeight.w600,
              color: AppColor.primaryColor,
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ));
  }
}

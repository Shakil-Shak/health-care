import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:health_care/const/assets/icons.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/components/custom_button.dart';
import 'package:health_care/view/components/custom_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Appointment Request",
            color: AppColor.primaryColor, size: 24, isBold: true),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            settingItem(
                svg: AppIcons.lockTwo,
                ontap: () {
                  // Get.toNamed(AppRoute.changePasswordScreen);
                },
                title: "Change Password"),
            const SizedBox(
              height: 20,
            ),
            settingItem(
                svg: AppIcons.delete,
                ontap: () {
                  showDeleteAccountDialog(context: context);
                },
                title: "Delete account"),
          ],
        ),
      ),
    );
  }

  settingItem({
    required VoidCallback ontap,
    required String title,
    required String svg,
  }) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 381,
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: ShapeDecoration(
          color: Color(0xFFFEEBEA),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(svg),
                const SizedBox(
                  width: 20,
                ),
                commonText(
                  title,
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                )
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
            )
          ],
        ),
      ),
    );
  }

  //==================================================delete account dialog with animation
  void showDeleteAccountDialog(
      {required BuildContext context, VoidCallback? delete}) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      pageBuilder: (context, animation, secondaryAnimation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          )),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: commonText(
                      "Are you sure?",
                      size: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "All your changes will be ",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          TextSpan(
                            text: "deleted ",
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                          TextSpan(
                            text:
                                "and you \nwill no longer be able to access them.",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: commonBorderButton(
                          onTap: () => Get.back(),
                          "Cancel",
                          borderColor: AppColor.black,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: commonButton(
                          onTap: () => Get.back(),
                          "Done",
                          textSize: 12,
                          textColor: AppColor.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}

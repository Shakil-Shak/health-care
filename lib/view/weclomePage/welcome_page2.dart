import 'package:flutter/material.dart';
import 'package:health_care/const/assets/images.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/auth/auth_page.dart';
import 'package:health_care/view/components/custom_button.dart';
import 'package:health_care/view/components/custom_text.dart';

class WeclomePage2 extends StatelessWidget {
  const WeclomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(AppImages.welcome2),
            Column(
              children: [
                commonText("Upload Medical Records",
                    size: 30, color: AppColor.primaryColor, isBold: true),
                commonText("Easily upload your reports in just a click",
                    size: 16, color: AppColor.primaryColor),
              ],
            ),
            Column(
              children: [
                commonButton("Next", onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AuthPage()),
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}

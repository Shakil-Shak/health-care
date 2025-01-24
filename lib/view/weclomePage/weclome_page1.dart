import 'package:flutter/material.dart';
import 'package:health_care/const/assets/images.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/components/custom_button.dart';
import 'package:health_care/view/components/custom_text.dart';
import 'package:health_care/view/weclomePage/welcome_page2.dart';

class WeclomePage1 extends StatelessWidget {
  const WeclomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(AppImages.weclome1),
            Image.asset(AppImages.welcomeTo),
            commonText("Your personalized health consultancy partner.",
                size: 16, color: AppColor.primaryColor),
            Column(
              children: [
                commonButton("Next", onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WeclomePage2()),
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

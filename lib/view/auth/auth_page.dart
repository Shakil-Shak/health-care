import 'package:flutter/material.dart';
import 'package:health_care/const/assets/images.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/auth/signIn/sign_in_page.dart';
import 'package:health_care/view/auth/signUp/sign_up_page.dart';
import 'package:health_care/view/components/custom_button.dart';
import 'package:health_care/view/components/custom_text.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                commonText("Now continue after register in",
                    size: 22, color: AppColor.black),
                commonText("Memorial Moment Magazine.",
                    size: 22, color: AppColor.primaryColor, isBold: true),
              ],
            ),
            Image.asset(AppImages.auth),
            Column(
              children: [
                commonButton("Sign in", onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                }),
                const SizedBox(
                  height: 15,
                ),
                commonButton("Sign up", onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
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

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:health_care/const/assets/images.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/weclomePage/weclome_page1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WeclomePage1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppImages.logo,

                    width:
                        screenWidth * 0.8, // Adjust width based on screen size
                    fit: BoxFit.contain,
                  ),

                  // Title
                  Image.asset(
                    AppImages.title,
                    width: screenWidth * 0.7,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 40),
                ],
              ),

              // Loading spinner
              const SpinKitRing(
                color: AppColor.primaryColor,
                size: 70.0,
                lineWidth: 4.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

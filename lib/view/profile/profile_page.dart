import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:health_care/const/assets/icons.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/components/custom_button.dart';
import 'package:health_care/view/components/custom_image.dart';
import 'package:health_care/view/components/custom_text.dart';
import 'package:health_care/view/profile/profileItems/edit_profile_page.dart';
import 'package:health_care/view/profile/profileItems/medical_records_page.dart';
import 'package:health_care/view/profile/profileItems/settings/settings_page.dart';
import 'package:health_care/view/profile/profileItems/wallet/wallet_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Profile",
            color: AppColor.primaryColor, size: 20, isBold: true),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              CommonImage(
                imageSrc:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSejLYdeLDMRg6iIcqEz_ePfzVJ-oRiOlU0GA&s",
                imageType: ImageType.network,
                height: 168,
                width: 168,
                borderRadius: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              commonText(
                "Daniel Martinez",
                size: 18,
                fontWeight: FontWeight.w400,
                color: AppColor.black,
              ),
              const SizedBox(
                height: 40,
              ),
              profileItem(
                  svg: AppIcons.editProfile,
                  text: "Edit Profile",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfilePage()),
                    );
                  }),
              profileItem(
                  svg: AppIcons.report,
                  text: "Medical Records",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MedicalRecordsPage()),
                    );
                  }),
              // profileItem(
              //     svg: AppIcons.subscription,
              //     text: "Subscription",
              //     onTap: () {
              //       // Get.toNamed(AppRoute.subscriptionScreen);
              //     }),
              profileItem(
                  svg: AppIcons.payHistory,
                  text: "Wallet",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WalletPage()),
                    );
                  }),
              profileItem(
                  svg: AppIcons.setting,
                  text: "Settings",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()),
                    );
                  }),
              profileItem(
                  svg: AppIcons.logout,
                  text: "Log Out",
                  isLogout: true,
                  onTap: () {
                    showLogoutDialog(
                      context: context,
                      logout: () {},
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  profileItem(
      {required String svg,
      required String text,
      bool isLogout = false,
      required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(svg),
                    const SizedBox(
                      width: 15,
                    ),
                    commonText(
                      text,
                      size: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ],
                ),
                if (!isLogout)
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  )
              ],
            ),
            const Divider(
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  //==================================================delete account dialog with animation
  void showLogoutDialog({required BuildContext context, VoidCallback? logout}) {
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
              padding: const EdgeInsets.all(16.0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: commonBorderButton(
                          onTap: () => Get.back(),
                          "No",
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: commonBorderButton(
                          onTap: logout,
                          "Yes",
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
      transitionDuration: const Duration(milliseconds: 500), // Slow motion
    );
  }
}

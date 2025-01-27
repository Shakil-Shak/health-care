import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/const/assets/icons.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/components/custom_image.dart';
import 'package:health_care/view/components/custom_text.dart';

class AppointmentCard extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const AppointmentCard({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 165,
      padding: const EdgeInsets.all(19.12),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFFCFCFC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.34),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 13.14,
            offset: Offset(0, 3.58),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CommonImage(
                imageSrc:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSePJmMoTNj08m5-7iwr8GzjPUXu6NiDL1baA&s",
                imageType: ImageType.network,
                height: 70,
                width: 70,
                borderRadius: 100,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText(
                    title,
                    size: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColor.black,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.dateOne),
                          const SizedBox(
                            width: 4,
                          ),
                          commonText(
                            "Monday, May 12",
                            size: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.black,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.timeTwo,
                            color: AppColor.primaryColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          commonText(
                            "11:00 - 12:00 Am",
                            size: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          //=======================================================button
          InkWell(
            onTap: onTap,
            child: Container(
              width: 345,
              height: 36,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 0.50,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFF1D242D),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Center(
                child: commonText(
                  "View Details",
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

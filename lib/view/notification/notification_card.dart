import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/const/assets/icons.dart';
import 'package:health_care/view/components/custom_text.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 80,
        width: 380,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: SvgPicture.asset(AppIcons.notificationOne),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText(
                  "Appointment Success",
                  size: 16,
                  fontWeight: FontWeight.w700,
                ),
                commonText(
                  "You have successfully booked your\n appointment with Dr. Emily Walker.",
                  size: 13,
                  maxLines: 10,
                  fontWeight: FontWeight.w400,
                )
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: commonText(
                "1h",
                size: 14,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}

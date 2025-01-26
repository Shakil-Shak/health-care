import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/const/assets/icons.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/components/custom_text.dart';

class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Appointment Request",
            color: AppColor.primaryColor, size: 24, isBold: true),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            paymentHistoryCard(
                isSchedule: true,
                title: "Schedule",
                price: "47.99",
                timeDate: "4:55 PM, 11/11/24"),
            const SizedBox(
              height: 20,
            ),
            paymentHistoryCard(
                isSchedule: false,
                title: "Premium Service",
                price: "47.99",
                timeDate: "4:55 PM, 11/11/24"),
          ],
        ),
      ),
    );
  }

  paymentHistoryCard({
    required bool isSchedule,
    required String title,
    required String price,
    required String timeDate,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: AppColor.primaryColorLight2, shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                      isSchedule ? AppIcons.schedule : AppIcons.premium),
                )),
            const SizedBox(
              width: 10,
            ),
            commonText(
              title,
              size: 16,
              fontWeight: FontWeight.w600,
              color: AppColor.black,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonText(
              "\$$price",
              size: 16,
              fontWeight: FontWeight.w600,
              color: AppColor.black,
            ),
            commonText(
              timeDate,
              size: 12,
              fontWeight: FontWeight.w400,
              color: AppColor.black,
            ),
          ],
        )
      ],
    );
  }
}

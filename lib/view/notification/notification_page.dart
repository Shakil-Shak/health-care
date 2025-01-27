import 'package:flutter/material.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/components/custom_text.dart';
import 'package:health_care/view/notification/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Notification",
            color: AppColor.black, size: 20, isBold: true),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return const NotificationCard();
              })),
    );
  }
}

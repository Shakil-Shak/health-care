import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/controller/appointment/appointment_controller.dart';
import 'package:health_care/view/appointment/appointment_card.dart';
import 'package:health_care/view/appointment/appointment_details_page.dart';
import 'package:health_care/view/components/custom_text.dart';

class AppointmentPage extends StatelessWidget {
  AppointmentPage({super.key});
  final AppointmentController appointmentController =
      Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Appointment Request",
            color: AppColor.primaryColor, size: 24, isBold: true),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Stack(
            children: [
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTab(0, "Upcoming"),
                    buildTab(1, "Completed"),
                    buildTab(2, "Canceled"),
                  ],
                );
              }),
              const Positioned(
                top: 21,
                left: 48,
                child: SizedBox(
                  width: 340,
                  child: Divider(color: AppColor.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Obx(() {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: getBody(appointmentController.selectedTab.value),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget buildTab(int index, String title) {
    return GestureDetector(
      onTap: () {
        appointmentController.selectedTab.value = index;
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: appointmentController.selectedTab.value == index
                  ? Colors.black
                  : Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Stack(
            children: [
              const Positioned(
                bottom: 0,
                child: Divider(
                  color: Colors.black,
                  thickness: 1.0,
                  endIndent: 0,
                  indent: 0,
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) => ScaleTransition(
                  scale: animation,
                  child: child,
                ),
                child: appointmentController.selectedTab.value == index
                    ? Container(
                        key: ValueKey(index),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        height: 4,
                        width: 90,
                      )
                    : Container(
                        key: ValueKey(index + 100),
                        height: 2,
                        width: 60,
                        color: Colors.transparent,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getBody(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return upcomingBody(key: const ValueKey(0));
      case 1:
        return completedBody(key: const ValueKey(1));
      case 2:
        return canceledBody(key: const ValueKey(2));
      default:
        return Container();
    }
  }

  Widget upcomingBody({Key? key}) {
    return ListView.builder(
      key: key,
      itemCount: 30,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AppointmentDetailsPage()),
            );
          },
          child: AppointmentCard(
            title: "Dr. Emama",
            onTap: () {},
          ),
        );
      },
    );
  }

  Widget completedBody({Key? key}) {
    return ListView.builder(
      key: key,
      itemCount: 5,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AppointmentDetailsPage()),
            );
          },
          child: AppointmentCard(
            title: "Dr. Tanu",
            onTap: () {},
          ),
        );
      },
    );
  }

  Widget canceledBody({Key? key}) {
    return ListView.builder(
      key: key,
      itemCount: 10,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AppointmentDetailsPage()),
            );
          },
          child: AppointmentCard(
            title: "Dr. Ananna",
            onTap: () {},
          ),
        );
      },
    );
  }
}

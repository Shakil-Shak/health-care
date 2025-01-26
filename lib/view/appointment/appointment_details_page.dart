import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:health_care/const/assets/icons.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/controller/appointment/appointment_controller.dart';
import 'package:health_care/view/components/custom_text.dart';

class AppointmentDetailsPage extends StatelessWidget {
  AppointmentDetailsPage({super.key});
  final AppointmentController appointmentController =
      Get.find<AppointmentController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Appointment Request",
            color: AppColor.primaryColor, size: 24, isBold: true),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              commonText(
                "Subject",
                size: 18,
                fontWeight: FontWeight.w700,
                color: AppColor.black,
              ),
              const SizedBox(
                height: 5,
              ),
              commonText(
                "Hydrate, avoid triggers, magnesium",
                size: 15,
                fontWeight: FontWeight.w400,
                color: AppColor.black,
              ),
              const SizedBox(
                height: 30,
              ),
              commonText(
                "Details",
                size: 18,
                fontWeight: FontWeight.w700,
                color: AppColor.black,
              ),
              const SizedBox(
                height: 5,
              ),
              //===========================================================details
              Obx(() {
                return AnimatedSize(
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointmentController.text,
                        maxLines: appointmentController.isExpanded.value
                            ? null
                            : appointmentController.calculatedMaxLinesCollapsed,
                        overflow: appointmentController.isExpanded.value
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            height: 0),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          appointmentController.isExpanded.value =
                              !appointmentController.isExpanded.value;
                        },
                        child: Text(
                          appointmentController.isExpanded.value
                              ? "View less"
                              : "View more",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              //============================================================call duration
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonText(
                    "Call Duration",
                    size: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColor.black,
                  ),
                  Container(
                    width: 130,
                    height: 42,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: ShapeDecoration(
                      color: AppColor.primaryColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.50, color: Color(0xFF1D242D)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Center(
                      child: commonText(
                        '45 min',
                        color: AppColor.white,
                        size: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              //=====================================================================time and date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  dateTimecontainer(
                      title: "Booking Date",
                      svg: AppIcons.calender,
                      text: "12-04-2024"),
                  dateTimecontainer(
                    title: "Booking Time",
                    svg: AppIcons.calender,
                    text: "12.30PM",
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  dateTimecontainer(
      {required String svg, required String text, required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText(
          title,
          size: 18,
          fontWeight: FontWeight.w700,
          color: AppColor.black,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
            width: 180,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.50, color: Color(0xFFF5382C)),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 1.20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset(
                      svg,
                      color: AppColor.black,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      height: 20,
                      width: 20,
                    ),
                  )
                ])),
      ],
    );
  }
}

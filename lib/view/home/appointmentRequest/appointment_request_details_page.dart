import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/const/assets/icons.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/components/custom_button.dart';
import 'package:health_care/view/components/custom_text.dart';

class AppointmentRequestDetailsPage extends StatelessWidget {
  const AppointmentRequestDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Appointment Details",
            color: AppColor.primaryColor, size: 24, isBold: true),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonText('Subject', size: 18, isBold: true),
              const SizedBox(height: 8),
              commonText('Hydrate, avoid triggers, magnesium'),
              const SizedBox(height: 12),
              commonText('Details', size: 18, isBold: true),
              const SizedBox(height: 8),
              commonText(
                "I'm sorry to hear about your migraines. Alongside medication, "
                "consider dietary adjustments like staying hydrated, avoiding "
                "trigger foods like aged cheese, processed meats, and alcohol, "
                "and incorporating magnesium-rich foods like nuts, seeds, and "
                "leafy greens. Consult a healthcare professional for personalized "
                "advice.",
              ),
              const SizedBox(height: 20),
              commonText('Medical Documents', size: 18, isBold: true),
              const SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: recordCard(onTap: () {}),
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonText('Call Duration', size: 18, isBold: true),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:
                        commonText('45 min', size: 14, color: AppColor.white),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonText('Booking Date',
                            size: 20,
                            isBold: true,
                            color: AppColor.primaryColor),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              commonText('12-04-2024',
                                  size: 16, color: AppColor.primaryColor),
                              const Icon(Icons.calendar_month_outlined,
                                  size: 24, color: AppColor.primaryColor),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonText('Booking Time',
                            size: 20,
                            isBold: true,
                            color: AppColor.primaryColor),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              commonText('12.30PM',
                                  size: 16, color: AppColor.primaryColor),
                              const Icon(Icons.access_time,
                                  size: 24, color: AppColor.primaryColor),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: commonBorderButton("Cancel")),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(child: commonButton("Accept"))
                ],
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  recordCard({required VoidCallback onTap}) {
    return Container(
      width: 95,
      height: 116,
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: const Color(0xFFDCDCF0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Column(
        children: [
          Container(
            height: 76,
            width: 76,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColor.primaryColor),
            child: Center(
              child: SvgPicture.asset(AppIcons.pdf),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          commonText(
            "Resume.pdf",
            size: 12,
            fontWeight: FontWeight.w400,
            color: AppColor.primaryColor,
          )
        ],
      ),
    );
  }
}

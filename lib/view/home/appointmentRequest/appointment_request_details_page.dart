import 'package:flutter/material.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/components/custom_button.dart';
import 'package:health_care/view/components/custom_text.dart';

class AppointmentRequestDetailsPage extends StatelessWidget {
  const AppointmentRequestDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
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
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonText('Call Duration', size: 18, isBold: true),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: commonText('45 min', size: 14, color: AppColor.white),
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
                      commonText('Booking Date', size: 16, isBold: true),
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
                            commonText('12-04-2024'),
                            const Icon(Icons.calendar_month_outlined, size: 18),
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
                      commonText('Booking Time', size: 16, isBold: true),
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
                            commonText('12.30PM'),
                            const Icon(Icons.access_time, size: 18),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
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
          ],
        ),
      ),
    );
  }
}

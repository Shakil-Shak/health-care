import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/const/assets/icons.dart';
import 'package:health_care/const/assets/images.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/components/custom_text.dart';
import 'package:health_care/view/home/appointmentRequest/appointment_request_details_page.dart';
import 'package:health_care/view/home/appointmentRequest/appointment_request_page.dart';
import 'package:health_care/view/home/upcomingAppointment/upcoming_appointment_details_page.dart';
import 'package:health_care/view/home/upcomingAppointment/upcoming_appointment_page.dart';
import 'package:health_care/view/notification/notification_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> appointments = [
    {'time': 'Today, 11:30 am', 'description': 'Appointment with Mr. Black'},
    {'time': 'Today, 06:30 pm', 'description': 'Appointment with Mr. White'},
    {'time': 'Today, 06:30 pm', 'description': 'Appointment with Mr. White'},
    {'time': 'Today, 06:30 pm', 'description': 'Appointment with Mr. White'},
  ];

  final List<Map<String, String>> clients = [
    {
      'name': 'Annette Black',
      'image': AppImages.dummyPerson,
      'time': 'Fri, 12:00 PM'
    },
    {
      'name': 'John Doe',
      'image': 'https://via.placeholder.com/150',
      'time': 'Mon, 10:00 AM'
    },
    {
      'name': 'Jane Smith',
      'image': 'https://via.placeholder.com/150',
      'time': 'Wed, 02:00 PM'
    },
    {
      'name': 'Mike Johnson',
      'image': 'https://via.placeholder.com/150',
      'time': 'Thu, 01:00 PM'
    },
    {
      'name': 'Sarah Wilson',
      'image': 'https://via.placeholder.com/150',
      'time': 'Tue, 04:00 PM'
    },
    {
      'name': 'Paul Brown',
      'image': 'https://via.placeholder.com/150',
      'time': 'Sat, 09:00 AM'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            AppImages.dummyPerson,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonText("Welcome", size: 16, color: Colors.grey),
                            commonText("Sophia Bennett",
                                size: 18,
                                color: AppColor.primaryColor,
                                isBold: true)
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationScreen()),
                          );
                        },
                        child: SvgPicture.asset(AppIcons.notification))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonText("Upcoming Appointments",
                        color: AppColor.black, size: 18),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const UpcomingAppointmentPage()),
                          );
                        },
                        child: commonText("See all",
                            color: AppColor.black, size: 14)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                buildClientsGrid(context),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonText(" Appointment Request",
                        color: AppColor.black, size: 18),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AppointmentRequestPage()),
                          );
                        },
                        child: commonText("See all",
                            color: AppColor.black, size: 14)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: appointments.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      color: AppColor.primaryColorLight2,
                      margin: const EdgeInsets.only(bottom: 15),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const UpcomingAppointmentDetailsPage()),
                          );
                        },
                        leading: SvgPicture.asset(
                          AppIcons.appointmentRequestCalendar,
                          color: AppColor.primaryColor,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: commonText(appointments[index]['time']!,
                              size: 18, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: commonText(appointments[index]['description']!,
                              size: 14),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildClientsGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // Disable scrolling within GridView
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemCount: clients.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const AppointmentRequestDetailsPage()),
              );
            },
            child: ClientCard(clients[index], context));
      },
    );
  }

  Widget ClientCard(Map<String, String> client, BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.3,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColor.primaryColorLight2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.3,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  AppImages.dummyPerson,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 20,
                child: FittedBox(
                    child: commonText(client['name']!,
                        size: 14, fontWeight: FontWeight.w500))),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 20,
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      AppIcons.appointmentDate,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    commonText(client['time']!, size: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/const/assets/icons.dart';
import 'package:health_care/const/assets/images.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/components/custom_text.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:health_care/view/home/appointmentRequest/appointment_request_details_page.dart';

class UpcomingAppointmentPage extends StatefulWidget {
  const UpcomingAppointmentPage({super.key});

  @override
  State<UpcomingAppointmentPage> createState() => _HomePageState();
}

class _HomePageState extends State<UpcomingAppointmentPage> {
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
      appBar: AppBar(
        title: commonText("Appointment List",
            color: AppColor.primaryColor, size: 24, isBold: true),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        _showDatePicker(context);
                      },
                      icon: SvgPicture.asset(
                        AppIcons
                            .appointmentRequestCalendar, // Path to your SVG file
                        color: AppColor.primaryColor,
                        width: 22,
                        height: 22,
                      ),
                      label: commonText('Select Date',
                          size: 16, color: AppColor.primaryColor, isBold: true),
                      iconAlignment: IconAlignment.end,
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: const BorderSide(
                              color: AppColor.primaryColor,
                              width: 1), // Adding a border
                        ),
                        backgroundColor: AppColor.white,
                        elevation: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
                ),
              ],
            )),
      ),
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

  void _showDatePicker(BuildContext context) async {
    await showDatePickerDialog(
      context: context,
      minDate: DateTime(1800, 1, 1),
      selectedDate: DateTime.now(),
      maxDate: DateTime(3500, 12, 31),
      splashColor: AppColor.primaryColor,
      slidersColor: AppColor.primaryColor,
      slidersSize: 15,
      highlightColor: AppColor.primaryColor,
      daysOfTheWeekTextStyle: const TextStyle(
          color: AppColor.black, fontWeight: FontWeight.bold, fontSize: 12),
      initialDate: DateTime.now(),
      leadingDateTextStyle: const TextStyle(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 18),
      selectedCellDecoration: BoxDecoration(
          color: AppColor.primaryColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5)),
      enabledCellsTextStyle: const TextStyle(fontSize: 12),
      selectedCellTextStyle:
          const TextStyle(fontSize: 12, color: AppColor.white),
      disabledCellsTextStyle: const TextStyle(fontSize: 12),
      currentDateTextStyle: const TextStyle(
        fontSize: 12,
      ),
    );
  }
}

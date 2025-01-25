import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/const/assets/icons.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/appointment/appointment_page.dart';
import 'package:health_care/view/chat/chat_page.dart';
import 'package:health_care/view/home/home_page.dart';
import 'package:health_care/view/profile/profile_page.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  BottomNavBarScreenState createState() => BottomNavBarScreenState();
}

class BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const AppointmentPage(),
    const ChatPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.home,
              color: _currentIndex == 0 ? AppColor.primaryColor : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.appointment,
              color: _currentIndex == 1 ? AppColor.primaryColor : Colors.grey,
            ),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.chat,
              color: _currentIndex == 2 ? AppColor.primaryColor : Colors.grey,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.profile,
              color: _currentIndex == 3 ? AppColor.primaryColor : Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

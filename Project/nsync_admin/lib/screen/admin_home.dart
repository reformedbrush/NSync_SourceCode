import 'package:flutter/material.dart';
import 'package:nsync_admin/components/sidebar.dart';
import 'package:nsync_admin/components/appbar.dart';
import 'package:nsync_admin/screen/complaints.dart';
import 'package:nsync_admin/screen/landing_page.dart';
import 'package:nsync_admin/screen/manage_club.dart';
import 'package:nsync_admin/screen/manage_department.dart';
import 'package:nsync_admin/screen/manage_events.dart';
import 'package:nsync_admin/screen/manage_faculty.dart';
import 'package:nsync_admin/screen/manage_students.dart';
import 'package:nsync_admin/screen/newsletter.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    LandingScreen(),
    EventsScreen(),
    FacultyScreen(),
    DepartmentScreen(),
    ClubsScreen(),
    StudentScreen(),
    NewsLetterScreen(),
    ComplaintsScreen(),
    const Center(child: Text('Settings Content')),
  ];

  void onSidebarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Row(
          children: [
            Expanded(
                flex: 1,
                child: SideBar(
                  onItemSelected: onSidebarItemTapped,
                )),
            Expanded(
              flex: 5,
              child: ListView(
                children: [
                  Appbar1(),
                  _pages[_selectedIndex],
                ],
              ),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:nsync_faculty/components/appbar.dart';
import 'package:nsync_faculty/components/sidebar.dart';
import 'package:nsync_faculty/screen/landingpg.dart';
import 'package:nsync_faculty/screen/my_club.dart';
import 'package:nsync_faculty/screen/my_department.dart';
import 'package:nsync_faculty/screen/manage_students.dart';
import 'package:nsync_faculty/screen/my_profile.dart';

class Facultyhome extends StatefulWidget {
  const Facultyhome({super.key});

  @override
  State<Facultyhome> createState() => _FacultyhomeState();
}

class _FacultyhomeState extends State<Facultyhome> {
  int _selectedIndex = 0;

  void onSidebarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    LandingScreen(),
    MyDepartment(),
    MyClub(),
    ManageStudents()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            Expanded(child: SideBar(onItemSelected: onSidebarItemTapped)),
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

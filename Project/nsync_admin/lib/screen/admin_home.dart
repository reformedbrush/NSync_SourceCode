import 'package:flutter/material.dart';
import 'package:nsync_admin/components/sidebar.dart';
import 'package:nsync_admin/components/appbar.dart';
import 'package:nsync_admin/screen/manage_events.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Dashboard Content')),
    EventsScreen(),
    const Center(child: Text('Reports Content')),
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
              child: Column(
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

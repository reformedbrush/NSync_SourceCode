import 'package:flutter/material.dart';
import 'package:nsync_admin/components/sidebar.dart';
import 'package:nsync_admin/components/appbar.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(flex: 1, child: SideBar()),
        Expanded(
          flex: 5,
          child: Appbar1(),
        )
      ],
    ));
  }
}

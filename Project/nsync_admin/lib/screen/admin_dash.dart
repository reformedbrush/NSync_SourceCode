import 'package:flutter/material.dart';
import 'package:nsync_admin/components/sidebar.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Center(
        child: Text("Main Content Area"),
      ),
    );
  }
}

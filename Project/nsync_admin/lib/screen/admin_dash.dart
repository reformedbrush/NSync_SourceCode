import 'package:flutter/material.dart';

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
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Image.asset(
                                '../Assets/logo.png',
                                width: 120,
                                height: 120,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

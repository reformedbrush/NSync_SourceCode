import 'package:flutter/material.dart';

class FacultyHome extends StatelessWidget {
  const FacultyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00664F),
        title: Text(
          "Faculty App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 280,
            decoration: BoxDecoration(
              color: Color(0xFF00664F),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Image.asset('./assets/globe.png')],
            ),
          ),
        ],
      )),
      bottomNavigationBar: NavigationBar(destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(
            icon: Icon(Icons.calendar_month), label: "Events"),
        NavigationDestination(icon: Icon(Icons.art_track), label: "Clubs"),
        NavigationDestination(icon: Icon(Icons.person), label: "Profile")
      ]),
    );
  }
}

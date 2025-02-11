import 'package:flutter/material.dart';

class StudentHome extends StatelessWidget {
  const StudentHome({super.key});

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
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 395,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 221, 221, 221),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(child: Text("Event 1")),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 395,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 221, 221, 221),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(child: Text("Event 2")),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 395,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 221, 221, 221),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(child: Text("Event 3")),
                ),
              ],
            ),
          )
        ],
      )),
      bottomNavigationBar: NavigationBar(destinations: [
        NavigationDestination(
            icon: Icon(Icons.calendar_month), label: "Events"),
        NavigationDestination(icon: Icon(Icons.art_track), label: "Clubs"),
        NavigationDestination(icon: Icon(Icons.person), label: "Profile")
      ]),
    );
  }
}

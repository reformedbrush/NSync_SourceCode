import 'package:flutter/material.dart';

class FacultyHome extends StatelessWidget {
  const FacultyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Faculty App"),
        ),
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(color: Color(0xFF00664F)),
          child: Row(
            children: [
              Column(
                children: [
                  BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.blue,
                      unselectedItemColor: Colors.grey,
                      currentIndex: 0,
                      onTap: (index) {
                        /* setState(() {
                      _selectedIndex = index;
                    });
                    items[_selectedIndex]; */
                      },
                      items: [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.work),
                          label: 'Projects',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.notifications),
                          label: 'Notifications',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.person),
                          label: 'Profile',
                        ),
                      ])
                ],
              ),
            ],
          ),
        )));
  }
}

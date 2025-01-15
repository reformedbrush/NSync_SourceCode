import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  final Function(int) onItemSelected;
  const SideBar({super.key, required this.onItemSelected});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final List<String> pages = [
    "Dashboard",
    "Manage Events",
    "Manage Faculty",
    "Manage Departments",
    "Manage Clubs",
    "Publish NewsLetters",
    "Review Complaints",
    "Settings"
  ];

  final List<IconData> icons = [
    Icons.house, // Icon for "Profile"
    Icons.event, // Icon for "Manage Events"
    Icons.school, // Icon for "Manage Faculty"
    Icons.school, // Icon for "Manage Departments"
    Icons.school, // Icon for "Manage Clubs"
    Icons.newspaper, // Icon for "Newsletter"
    Icons.reviews,
    Icons.settings, // Icon for "Manage Faculty"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        const Color(0xFF121212),
        const Color.fromARGB(255, 43, 43, 43)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        widget.onItemSelected(index);
                      },
                      leading: Icon(icons[index], color: Colors.white),
                      title: Text(pages[index],
                          style: TextStyle(color: Colors.white)),
                    );
                  }),
            ],
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined, color: Colors.white),
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

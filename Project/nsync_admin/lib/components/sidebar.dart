import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<String> pages = ["Profile", "Manage Events", "Manage Faculty"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                child: Text(
                  "Dashboard Menu",
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(color: Colors.lightBlue),
              ),
              ListTile(
                leading: Icon(Icons.supervised_user_circle),
                title: Text("Profile"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.volunteer_activism_rounded),
                title: Text("Manage Events"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.volunteer_activism_rounded),
                title: Text("Manage Faculty"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.volunteer_activism_rounded),
                title: Text("Manage Students"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.volunteer_activism_rounded),
                title: Text("Manage Clubs"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.build),
                title: Text("Settings"),
                onTap: () {},
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text("Logout"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

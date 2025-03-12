import 'package:flutter/material.dart';
import 'package:nsync_stud/screen/login.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFCFFFF6),
                          borderRadius: BorderRadius.circular(20)),
                      height: 620,
                      width: 600,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Image.asset("./assets/avatar.png"),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Akshai R S",
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(40),
                            child: Text(
                                "lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum"),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFFFFFFF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 100, vertical: 18)),
                              onPressed: () {},
                              child: Text("Edit Profile",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFFFFFFF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 112, vertical: 18)),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login1()));
                              },
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

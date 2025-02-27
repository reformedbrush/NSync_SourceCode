import 'package:flutter/material.dart';
import 'package:nsync_faculty/main.dart';
import 'package:nsync_faculty/screen/host_event.dart';

class MyDepartment extends StatefulWidget {
  const MyDepartment({super.key});

  @override
  State<MyDepartment> createState() => _MyDepartmentState();
}

class _MyDepartmentState extends State<MyDepartment> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Hostevent()));
                  },
                  label: Text(
                    "Host Event",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF161616),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 18)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

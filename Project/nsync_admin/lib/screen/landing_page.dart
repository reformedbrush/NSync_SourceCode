import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    colors: [const Color(0xFF1F4037), Color(0xFF99F2C8)],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft)),
            width: 1250,
            height: 90,
            child: Padding(
              padding: const EdgeInsets.only(top: 27, left: 20),
              child: Text(
                "Welcome Admin",
                style: TextStyle(
                    color: Color(0xFF1F4037),
                    fontSize: 25,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffeeeeeee),
                    ),
                    width: 700,
                    height: 500,
                    child: Text("Events Details"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffeeeeeee),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 500,
                  width: 530,
                  child: Text("Other"),
                )
              ],
            ),
          ),
          Container(
            height: 500,
            width: 500,
            child: Text("data"),
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

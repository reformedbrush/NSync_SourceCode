import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    colors: [const Color(0xFF1F4037), Color(0xFF99F2C8)],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft)),
            width: 895,
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
        ],
      ),
    ));
  }
}

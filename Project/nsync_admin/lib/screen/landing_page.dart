import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [const Color(0xFF1F4037), Color(0xFF99F2C8)],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft)),
                width: 695,
                height: 90,
                child: Text("data"),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                color: Colors.blue,
                child: Text("data"),
              ),
            ],
          ),
        ));
  }
}

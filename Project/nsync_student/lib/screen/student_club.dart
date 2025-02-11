import 'package:flutter/material.dart';
import 'package:nsync_student/components/appbar.dart';

class StuClubs extends StatelessWidget {
  const StuClubs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(color: Color(0xFF00664F)),
        height: 250,
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: ListView(
                children: [
                  Appbar1(),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

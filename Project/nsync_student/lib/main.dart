import 'package:flutter/material.dart';
/* import 'package:nsync_student/screen/login.dart';
 */
import 'package:nsync_student/screen/student_club.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StuClub(),
    );
  }
}

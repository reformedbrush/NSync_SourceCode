import 'package:flutter/material.dart';
import 'package:nsync_faculty/screen/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login1(),
      debugShowCheckedModeBanner: false,
    );
  }
}

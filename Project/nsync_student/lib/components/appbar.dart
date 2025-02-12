import 'package:flutter/material.dart';

class Appbar1 extends StatelessWidget {
  const Appbar1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Color(0xFF00664F),
      title: Text(
        "Faculty App",
        style: TextStyle(color: Colors.white),
      ),
    ));
  }
}

import 'package:flutter/material.dart';

class Appbar1 extends StatelessWidget {
  const Appbar1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(color: Colors.amber),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
      ),
    );
  }
}

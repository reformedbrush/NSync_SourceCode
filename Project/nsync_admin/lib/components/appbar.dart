import 'package:flutter/material.dart';

class Appbar1 extends StatelessWidget {
  const Appbar1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 50,
            color: Colors.blueAccent.shade700,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.person),
                SizedBox(
                  width: 10,
                ),
                Text("Admin"),
                SizedBox(
                  width: 40,
                )
              ],
            )),
      ],
    );
  }
}

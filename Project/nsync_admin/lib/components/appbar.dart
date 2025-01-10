import 'package:flutter/material.dart';

class Appbar1 extends StatelessWidget {
  const Appbar1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        color: Colors.blueAccent.shade700,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.person,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Admin",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 40,
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';

class Appbar1 extends StatelessWidget {
  const Appbar1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration: BoxDecoration(color: const Color(0xffeeeeeee)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.person,
              color: Color.fromARGB(255, 109, 88, 248),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Faculty",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 40,
            )
          ],
        ));
  }
}

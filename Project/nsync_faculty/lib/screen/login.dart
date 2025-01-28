import 'package:flutter/material.dart';

class Login1 extends StatelessWidget {
  const Login1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
            child: Container(
          child: Center(
            child: Row(
              children: [
                Text("Login"),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

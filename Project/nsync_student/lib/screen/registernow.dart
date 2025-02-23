import 'package:flutter/material.dart';
import 'package:nsync_student/screen/login.dart';

class Registernow extends StatelessWidget {
  const Registernow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 360,
              child: Image.asset("./assets/regrobo.png"),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You cannot perform",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  "this action !",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Contact Your Department Coordinator",
                  style: TextStyle(fontSize: 18),
                ),
                Text("To get you signed up!!")
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF161616),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 18)),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login1()));
                  },
                  child: Text(
                    "Return to Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

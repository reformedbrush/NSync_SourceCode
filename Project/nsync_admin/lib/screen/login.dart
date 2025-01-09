import 'package:flutter/material.dart';
import 'package:nsync_admin/screen/admin_dash.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Icon(
              Icons.cabin,
              size: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Hello, Welcome Back!!"),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Enter You ID",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Password",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 35.0),
                  child: Text("Forget Password?"),
                )
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminDashboard(),
                      ));
                },
                child: Text("Login"))
          ],
        ),
      )),
    );
  }
}

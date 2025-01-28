import 'package:flutter/material.dart';
import 'package:nsync_faculty/components/clrsafearea.dart';
import 'package:nsync_faculty/screen/adminhome.dart';

class Login1 extends StatelessWidget {
  const Login1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ColoredSafeArea(
            child: Container(
          decoration: BoxDecoration(color: Color(0xFF0D0D1B)),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                ),
                Container(
                  width: 340,
                  height: 500,
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset('./assets/logo.png'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "Sign in to your",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Account",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'E-mail ID',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Password',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            ))),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Column(
                        children: [
                          Text(
                            "Forget Password?",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1D61E7),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 145, vertical: 18)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AdminHome(),
                                ));
                          },
                          child: Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

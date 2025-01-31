import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:nsync_faculty/components/clrsafearea.dart';
import 'package:nsync_faculty/main.dart';
import 'package:nsync_faculty/screen/facultyhome.dart';
import 'package:cherry_toast/cherry_toast.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  // signin
  Future<void> signin() async {
    try {
      await supabase.auth.signInWithPassword(
          password: _facPasswordController.text,
          email: _facEmailController.text);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FacultyHome(),
          ));
    } catch (e) {
      print("ERROR LOGIN: $e");
      CherryToast.error(
              description: Text("No user found for that email.",
                  style: TextStyle(color: Colors.black)),
              animationType: AnimationType.fromRight,
              animationDuration: Duration(milliseconds: 1000),
              autoDismiss: true)
          .show(context);
      print('No user found for that email.');
    }
  }

  TextEditingController _facPasswordController = TextEditingController();

  TextEditingController _facEmailController = TextEditingController();

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
                        controller: _facEmailController,
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
                        controller: _facPasswordController,
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
                            /*  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FacultyHome(),
                                )); */
                            signin();
                          },
                          child: Text(
                            "Sign In",
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

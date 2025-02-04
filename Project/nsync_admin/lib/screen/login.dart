import 'package:flutter/material.dart';
import 'package:nsync_admin/components/form_validation.dart';
import 'package:nsync_admin/main.dart';
import 'package:nsync_admin/screen/admin_home.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:cherry_toast/cherry_toast.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  final TextEditingController _adminEmailController = TextEditingController();
  final TextEditingController _adminPassController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //sign in

  Future<void> signIn() async {
    try {
      await supabase.auth.signInWithPassword(
          password: _adminPassController.text,
          email: _adminEmailController.text);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AdminHome(),
          ));
    } catch (e) {
      print("Error occur in login:$e");
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: SafeArea(
            child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(253, 246, 246, 246),
                borderRadius: BorderRadius.circular(10)),
            width: 500,
            height: 650,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  Image.asset('../assets/logo200.png'),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Hello, Welcome Back!!"),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.0),
                    child: TextFormField(
                      validator: (value) => FormValidation.validateEmail(value),
                      controller: _adminEmailController,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
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
                    child: TextFormField(
                      validator: (value) =>
                          FormValidation.validatePassword(value),
                      controller: _adminPassController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
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
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF161616),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 35, vertical: 18)),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminHome(),
                            ));

                        /* if (formKey.currentState!.validate()) {
                          signIn();
                        }  */ //sign in function
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}

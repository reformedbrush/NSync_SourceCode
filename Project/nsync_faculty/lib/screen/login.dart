import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:nsync_faculty/components/formvalidation.dart';
import 'package:nsync_faculty/main.dart';
import 'package:nsync_faculty/screen/facultyhome.dart';
import 'package:cherry_toast/cherry_toast.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  final formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _facPasswordController = TextEditingController();
  final TextEditingController _facEmailController = TextEditingController();

  @override
  void dispose() {
    _facPasswordController.dispose();
    _facEmailController.dispose();
    super.dispose();
  }

  // Sign-in function
  Future<void> signin() async {
    try {
      final auth = await supabase.auth.signInWithPassword(
        password: _facPasswordController.text,
        email: _facEmailController.text,
      );

      String uid = auth.user!.id;
      final res = await supabase
          .from("tbl_faculty")
          .select()
          .eq("faculty_id", uid)
          .maybeSingle();

      if (res != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Facultyhome()),
        );
      } else {
        CherryToast.error(
          description: const Text(
            "Invalid User",
            style: TextStyle(color: Colors.black),
          ),
          animationType: AnimationType.fromRight,
          animationDuration: const Duration(milliseconds: 1000),
          autoDismiss: true,
        ).show(context);
      }
    } catch (e) {
      CherryToast.error(
        description: Text(
          "$e",
          style: const TextStyle(color: Colors.black),
        ),
        animationType: AnimationType.fromRight,
        animationDuration: const Duration(milliseconds: 1000),
        autoDismiss: true,
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              height: 650,
              width: 900,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey)),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                        "../assets/Brazuca.png"), // Fixed asset path
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0, right: 40),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Faculty Login",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 25),
                            TextFormField(
                              validator: (value) =>
                                  FormValidation.validateEmail(value),
                              controller: _facEmailController,
                              decoration: const InputDecoration(
                                  hintText: "Login",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    // Red border on validation error
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue))),
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              validator: (value) =>
                                  FormValidation.validatePassword(value),
                              controller: _facPasswordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  hintText: "Password",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .grey), // Red border on validation error
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue))),
                            ),
                            const SizedBox(height: 15),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF161616),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 150, vertical: 25)),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  signin();
                                }
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

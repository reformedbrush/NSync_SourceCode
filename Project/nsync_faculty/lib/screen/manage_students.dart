import 'package:flutter/material.dart';
import 'package:nsync_faculty/components/formvalidation.dart';

class ManageStudents extends StatefulWidget {
  const ManageStudents({super.key});

  @override
  State<ManageStudents> createState() => _ManageStudentsState();
}

class _ManageStudentsState extends State<ManageStudents>
    with SingleTickerProviderStateMixin {
  bool _isFormVisible = false;
  final Duration _animationDuration = const Duration(milliseconds: 300);

  //controllers

  final TextEditingController _studentController = TextEditingController();
  final TextEditingController _stEmailController = TextEditingController();
  final TextEditingController _stPasswordController = TextEditingController();
  final TextEditingController _stAdmnoController = TextEditingController();
  final TextEditingController _stContactController = TextEditingController();
  final TextEditingController _stAcdYearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF161616),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 18)),
                  onPressed: () {
                    setState(() {
                      _isFormVisible =
                          !_isFormVisible; // Toggle form visibility
                    });
                  },
                  label: Text(
                    _isFormVisible ? "Cancel" : "Add Student",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    _isFormVisible ? Icons.cancel : Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          AnimatedSize(
            duration: _animationDuration,
            curve: Curves.easeInOut,
            child: _isFormVisible
                ? Form(
                    child: Container(
                    width: 700,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(8),
                              child: TextFormField(
                                controller: _studentController,
                                validator: (value) =>
                                    FormValidation.validateName(value),
                                decoration: InputDecoration(
                                    hintText: "Student Name",
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    errorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            )),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(8),
                              child: TextFormField(
                                controller: _stAdmnoController,
                                decoration: InputDecoration(
                                    hintText: "Admission Number",
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            ))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(8),
                              child: TextFormField(
                                controller: _stEmailController,
                                validator: (value) =>
                                    FormValidation.validateEmail(value),
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    errorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            )),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: TextFormField(
                                  controller: _stPasswordController,
                                  validator: (value) =>
                                      FormValidation.validatePassword(value),
                                  decoration: InputDecoration(
                                      hintText: "Assign Password",
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue)),
                                      errorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue))),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (value) =>
                                    FormValidation.validateContact(value),
                                controller: _stContactController,
                                decoration: InputDecoration(
                                    hintText: "Contact Number",
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    errorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            )),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(8),
                              child: TextFormField(
                                controller: _stAcdYearController,
                                decoration: InputDecoration(
                                    hintText: "Academic Year",
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    errorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            ))
                          ],
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF017AFF),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 70, vertical: 22),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () {
                              /* if (eid == 0) {
                                studentInsert();
                              } else {
                                editStudent();
                              } */
                            },
                            child: Text(
                              "Insert",
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  ))
                : Container(),
          )
        ],
      ),
    );
  }
}

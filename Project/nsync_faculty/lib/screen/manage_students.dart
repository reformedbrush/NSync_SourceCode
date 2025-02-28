import 'package:flutter/material.dart';
import 'package:nsync_faculty/components/formvalidation.dart';
import 'package:nsync_faculty/main.dart';

class ManageStudents extends StatefulWidget {
  const ManageStudents({super.key});

  @override
  State<ManageStudents> createState() => _ManageStudentsState();
}

class _ManageStudentsState extends State<ManageStudents>
    with SingleTickerProviderStateMixin {
  bool _isFormVisible = false;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  String? selectedDept;
  //controllers

  final TextEditingController _studentController = TextEditingController();
  final TextEditingController _stEmailController = TextEditingController();
  final TextEditingController _stPasswordController = TextEditingController();
  final TextEditingController _stAdmnoController = TextEditingController();
  final TextEditingController _stContactController = TextEditingController();
  final TextEditingController _stAcdYearController = TextEditingController();

  List<Map<String, dynamic>> StudList = [];
  List<Map<String, dynamic>> DeptList = [];

  //register

  Future<void> Register() async {
    try {
      final auth = await supabase.auth.signUp(
          password: _stPasswordController.text, email: _stEmailController.text);
      final uid = auth.user!.id;
      if (uid.isNotEmpty || uid != "") {
        studentInsert(uid);
      }
    } catch (e) {
      print("AUTH ERROR: $e");
    }
  }

  // insert

  Future<void> studentInsert(final id) async {
    try {
      String Name = _studentController.text;
      String admissionNo = _stAdmnoController.text;
      String Email = _stEmailController.text;
      String Password = _stPasswordController.text;
      String Phone = _stContactController.text;
      String academicYear = _stAcdYearController.text;

      if (selectedDept == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "Please Select A Department",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ));
        return;
      }
      await supabase.from('tbl_student').insert({
        'student_id': id,
        'student_name': Name,
        'student_admno': admissionNo,
        'student_email': Email,
        'student_password': Password,
        'student_contact': Phone,
        'department_id': selectedDept,
        'academic_year': academicYear
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Student Data Inserted Sucessfully",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ));

      fetchStudent();

      _studentController.clear();
      _stAdmnoController.clear();
      _stEmailController.clear();
      _stPasswordController.clear();
      _stContactController.clear();
      _stAcdYearController.clear();
      setState(() {
        selectedDept = null;
      });
    } catch (e) {
      print("ERROR INSERTING DATA: $e");
    }
  }

  //select

  Future<void> fetchDept() async {
    try {
      final response = await supabase.from('tbl_department').select();
      if (response.isNotEmpty) {
        setState(() {
          DeptList = response;
        });
      }
    } catch (e) {
      print("ERROR FETCHING DEPT: $e");
    }
  }

  Future<void> fetchStudent() async {
    try {
      final response =
          await supabase.from('tbl_student').select('*,tbl_department(*)');
      setState(() {
        StudList = response;
      });
    } catch (e) {
      print("ERROR FETCHING: $e");
    }
  }

  // delete

  Future<void> deltStudent(String did) async {
    try {
      await supabase.from('tbl_student').delete().eq('student_id', did);
      fetchStudent();
    } catch (e) {
      print("ERROR DELETING: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDept();
    fetchStudent();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        height: 2000,
        child: Padding(
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 18)),
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
                        child: SizedBox(
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
                                        hintText: "Name",
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
                                            borderSide: BorderSide(
                                                color: Colors.blue))),
                                  ),
                                )),
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: TextFormField(
                                    controller: _stAdmnoController,
                                    decoration: InputDecoration(
                                        hintText: "Admission_No",
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blue))),
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
                                            borderSide: BorderSide(
                                                color: Colors.blue))),
                                  ),
                                )),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: TextFormField(
                                      controller: _stPasswordController,
                                      validator: (value) =>
                                          FormValidation.validatePassword(
                                              value),
                                      decoration: InputDecoration(
                                          hintText: "Password",
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue)),
                                          errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue)),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue))),
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
                                        hintText: "Phone",
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
                                            borderSide: BorderSide(
                                                color: Colors.blue))),
                                  ),
                                )),
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: TextFormField(
                                    controller: _stAcdYearController,
                                    decoration: InputDecoration(
                                        hintText: "Academic_Year",
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
                                            borderSide: BorderSide(
                                                color: Colors.blue))),
                                  ),
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: DropdownButtonFormField<String>(
                                      validator: (value) =>
                                          FormValidation.validateDropdown(
                                              value),
                                      value: selectedDept,
                                      hint: const Text("Select Department"),
                                      items: DeptList.map((department) {
                                        return DropdownMenuItem(
                                            value: department['department_id']
                                                .toString(),
                                            child: Text(
                                                department['department_name']));
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedDept = newValue;
                                        });
                                      }),
                                ))
                              ],
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF017AFF),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 70, vertical: 22),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                onPressed: () {
                                  Register();
                                },
                                child: Text(
                                  "Insert",
                                  style: TextStyle(color: Colors.white),
                                )),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ))
                    : Container(),
              ),
              Container(
                child: Center(
                  child: Text("Students Data",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text("SL.No")),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Adm No.')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Password')),
                      DataColumn(label: Text('Contact No.')),
                      DataColumn(label: Text('Department')),
                      /*                   DataColumn(label: Text('Photo')),
         */
                      DataColumn(label: Text("Delete"))
                    ],
                    rows: StudList.asMap().entries.map((entry) {
                      print(entry.value);
                      return DataRow(cells: [
                        DataCell(Text((entry.key + 1000).toString())),
                        DataCell(Text(entry.value['student_name'])),
                        DataCell(Text(entry.value['student_admno'].toString())),
                        DataCell(Text(entry.value['student_email'])),
                        DataCell(Text(entry.value['student_password'])),
                        DataCell(
                            Text(entry.value['student_contact'].toString())),
                        DataCell(Text(
                            entry.value['tbl_department']['department_name'])),
                        DataCell(IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            //delete function
                            deltStudent(entry.value['student_id'].toString());
                          },
                        ))
                      ]);
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nsync_admin/components/insert_form.dart';
import 'package:nsync_admin/main.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen>
    with SingleTickerProviderStateMixin {
  bool _isFormVisible = false; // To manage form visibility
  final Duration _animationDuration = const Duration(milliseconds: 300);

  List<Map<String, dynamic>> StudList = [];

  //controller
  final TextEditingController _studentController = TextEditingController();
  final TextEditingController _stEmailController = TextEditingController();
  final TextEditingController _stPasswordController = TextEditingController();
  final TextEditingController _stAdmnoController = TextEditingController();
  final TextEditingController _stContactController = TextEditingController();

  Future<void> studentInsert() async {
    try {
      String Name = _studentController.text;
      String Admission_No = _stAdmnoController.text;
      String Email = _stEmailController.text;
      String Password = _stPasswordController.text;
      String Contact = _stContactController.text;
      await supabase.from('tbl_student').insert({
        'student_name': Name,
        'student_admno': Admission_No,
        'student_email': Email,
        'student_password': Password,
        'student_contact': Contact
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Student Data Inserted Sucessfully",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ));
    } catch (e) {
      print("ERROR: $e");
    }
  }

  Future<void> fetchStudent() async {
    try {
      final response = await supabase.from('tbl_student').select();
      setState(() {
        StudList = response;
      });
    } catch (e) {
      print('ERROR: $e');
    }
  }

  //edit
  int eid = 0;

  Future<void> editStudent() async {
    try {
      await supabase.from('tbl_student').update({
        'student_name': _studentController.text,
        'student_admno': _stAdmnoController.text,
        'student_email': _stEmailController.text,
        'student_password': _stPasswordController.text,
        'student_contact': _stContactController.text
      }).eq('student_id', eid);
      fetchStudent();
      _studentController.clear();
      _stAdmnoController.clear();
      _stEmailController.clear();
      _stPasswordController.clear();
      _stContactController.clear();
    } catch (e) {
      print("ERROR: $e");
    }
  }

  //delete

  Future<void> deltStudent(String did) async {
    try {
      await supabase.from('tbl_student').delete().eq('student_id', did);
      fetchStudent();
    } catch (e) {
      print("ERROR: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchStudent();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Manage Students"),
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
                    "Add Student",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.add,
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
                              padding: const EdgeInsets.all(8.0),
                              child: TextFieldStyle(
                                inputController: _studentController,
                                label: "Name",
                              ),
                            )),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(8),
                              child: TextFieldStyle(
                                  label: "Admission_No",
                                  inputController: _stAdmnoController),
                            ))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(8),
                              child: TextFieldStyle(
                                  label: "Email",
                                  inputController: _stEmailController),
                            )),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(8),
                              child: TextFieldStyle(
                                  label: 'Password',
                                  inputController: _stPasswordController),
                            ))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(8),
                              child: TextFieldStyle(
                                  label: 'Contact',
                                  inputController: _stContactController),
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
                              if (eid == 0) {
                                studentInsert();
                                fetchStudent();
                              } else {
                                editStudent();
                              }
                            },
                            child: Text(
                              "Insert",
                              style: TextStyle(color: Colors.white),
                            )),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ))
                : Container(),
          ),
          Container(
            child: Center(
              child: Text("Students Data",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
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
                  DataColumn(label: Text("Edit")),
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
                    DataCell(Text(entry.value['student_contact'].toString())),
                    DataCell(IconButton(
                      icon: const Icon(Icons.edit, color: Colors.green),
                      onPressed: () {
                        setState(() {
                          _studentController.text = entry.value['student_name'];
                          _stAdmnoController.text =
                              entry.value['student_admno'];
                          _stEmailController.text =
                              entry.value['student_email'];
                          _stPasswordController.text =
                              entry.value['student_password'];
                          _stContactController.text =
                              entry.value['student_contact'];
                          eid = entry.value['student_id'];
                          _isFormVisible = true;
                        });
                      },
                    )),
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
    );
  }
}

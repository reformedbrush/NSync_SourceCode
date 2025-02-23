import 'package:flutter/material.dart';
import 'package:nsync_admin/components/insert_form.dart';
import 'package:nsync_admin/main.dart';

class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({super.key});

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen>
    with SingleTickerProviderStateMixin {
  bool _isFormVisible = false; // To manage form visibility
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final TextEditingController _deptController = TextEditingController();

// list to store tbl data for displaying
  List<Map<String, dynamic>> DeptList = [];

  Future<void> insertDept() async {
    //insert function
    try {
      String Department = _deptController.text;
      await supabase
          .from('tbl_department')
          .insert({'department_name': Department});

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Department Name Inserted Sucessfully",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ));
      fetchDepartment();
      _deptController.clear();
    } catch (e) {
      print("ERROR ADDING DATA");
    }
  }

  Future<void> fetchDepartment() async {
    try {
      //stores tbl data to variable 'response'
      final response = await supabase.from('tbl_department').select();
      // print response
      setState(() {
        DeptList = response;
      });
    } catch (e) {
      print("ERROR RETRIEVING DATA");
    }
  }

  Future<void> deldepartment(String did) async {
    try {
      await supabase.from("tbl_department").delete().eq("department_id", did);
      fetchDepartment();
    } catch (e) {
      print("ERROR: $e");
    }
  }

  int eid = 0;

  Future<void> editdept() async {
    try {
      await supabase.from("tbl_department").update(
          {'department_name': _deptController.text}).eq('department_id', eid);
      fetchDepartment();
      _deptController.clear();
    } catch (e) {
      print("Error:$e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDepartment();
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
              Text("Manage Department"),
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
                    _isFormVisible ? "Cancel" : "Add Department",
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
                              padding: const EdgeInsets.all(8.0),
                              child: TextFieldStyle(
                                inputController: _deptController,
                                label: "Department",
                              ),
                            )),
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
                                insertDept();
                              } else {
                                editdept();
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
              child: Text("Departments Table",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 249, 249, 249),
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(6),
            ),
            height: 500,
            width: 700,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DataTable(
                columns: [
                  DataColumn(label: Text("Sl.No")),
                  DataColumn(label: Text("Department")),
                  DataColumn(label: Text("Edit")),
                  DataColumn(label: Text("Delete"))
                ],
                rows: DeptList.asMap().entries.map((entry) {
                  print(entry.value);
                  return DataRow(cells: [
                    DataCell(Text((entry.key + 1).toString())),
                    DataCell(Text(entry.value['department_name'])),
                    DataCell(IconButton(
                      icon: const Icon(Icons.edit, color: Colors.green),
                      onPressed: () {
                        setState(() {
                          _deptController.text = entry.value['department_name'];
                          eid = entry.value['department_id'];
                          _isFormVisible = !_isFormVisible;
                        });
                      },
                    )),
                    DataCell(IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        deldepartment(entry.value['department_id'].toString());
                        //delete function
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

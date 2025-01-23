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

  List<Map<String, dynamic>> DeptList =
      []; // list to store tbl data for displaying

  Future<void> insertDept() async {
    //insert function
    try {
      String Department = _deptController.text;
      await supabase
          .from('tbl_department')
          .insert({'department_name': Department});

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Department Name Inserted",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ));
      fetchDepartment();
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
                    "Add Department",
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
                    height: 250,
                    width: 500,
                    decoration: BoxDecoration(
                        color: Color(0xffeeeeeee),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 246, 243, 243)
                                .withOpacity(0.5),
                          )
                        ]),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: TextFieldStyle(
                              inputController: _deptController,
                              label: "Department",
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF017AFF),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 70, vertical: 20),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                onPressed: () {
                                  insertDept();
                                },
                                child: Text(
                                  "Insert",
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        )
                      ],
                    ),
                  ))
                : Container(),
          ),
          Container(
            height: 500,
            child: Center(
              child: DataTable(
                columns: [
                  DataColumn(label: Text("Sl.No")),
                  DataColumn(label: Text("Department")),
                  DataColumn(label: Text("Delete")),
                ],
                rows: DeptList.asMap().entries.map((entry) {
                  print(entry.value);
                  return DataRow(cells: [
                    DataCell(Text((entry.key + 1).toString())),
                    DataCell(Text(entry.value['department_name'])),
                    DataCell(IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        //delete function here
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

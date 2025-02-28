import 'package:flutter/material.dart';
import 'package:nsync_admin/main.dart';

class AssignClass1 extends StatefulWidget {
  const AssignClass1({super.key});

  @override
  State<AssignClass1> createState() => _AssignClass1State();
}

class _AssignClass1State extends State<AssignClass1>
    with SingleTickerProviderStateMixin {
  bool _isFormVisible = false;

  String? selectedDept;
  String? selectedFac;

  List<Map<String, dynamic>> DeptList = [];
  List<Map<String, dynamic>> FacList = [];
  List<Map<String, dynamic>> AssignList = [];

  final Duration _animationDuration = const Duration(milliseconds: 300);

  final formKey = GlobalKey<FormState>();

  final TextEditingController _acdyearController = TextEditingController();

  //fetch

  Future<void> fetchDept() async {
    try {
      final response = await supabase.from('tbl_department').select();
      if (response.isNotEmpty) {
        setState(() {
          DeptList = response;
        });
      }
    } catch (e) {
      print("ERROR FETCHING DEPARTMENT: $e");
    }
  }

  Future<void> fetchFaculty(String id) async {
    try {
      final response =
          await supabase.from('tbl_faculty').select().eq("department_id", id);
      if (response.isNotEmpty) {
        setState(() {
          FacList = response;
        });
      }
    } catch (e) {
      print("ERROR FETCHING FACULTY: $e");
    }
  }

  //select

  Future<void> fetchAssign() async {
    try {
      final response =
          await supabase.from('tbl_assign').select("*, tbl_faculty(*)");
      setState(() {
        AssignList = response;
      });
    } catch (e) {
      print('ERROR FETCHING ASSIGN TBL DATA: $e');
    }
  }

  //insert

  Future<void> insertClass() async {
    try {
      String YYYY = _acdyearController.text;
      final assign = await supabase
          .from('tbl_assign')
          .select()
          .eq('faculty_id', selectedFac!); // checks if fac already assigned
      if (assign.length > 0) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "Faculty Already Assigned",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ));
      } else {
        await supabase
            .from('tbl_assign')
            .insert({'academic_year': YYYY, 'faculty_id': selectedFac});
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "Class Assigned Sucessfully",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ));
        fetchAssign();
      }

      _acdyearController.clear();
      setState(() {
        selectedDept = null;
        selectedFac = null;
      });
    } catch (e) {
      print("ERROR INSERTING ASSIGN DATA: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDept();
    fetchAssign();
  }

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
                padding: EdgeInsets.all(10),
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
                    _isFormVisible ? "Cancel" : "Assign Class",
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
            child: !_isFormVisible
                ? Form(key: formKey, child: Container())
                : SizedBox(
                    width: 700,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(8),
                              child: DropdownButtonFormField<String>(
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
                                    fetchFaculty(newValue!);
                                  }),
                            )),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(8),
                              child: DropdownButtonFormField(
                                  value: selectedFac,
                                  hint: const Text("Select Faculty"),
                                  items: FacList.map((faculty) {
                                    return DropdownMenuItem(
                                        value: faculty['faculty_id'].toString(),
                                        child: Text(faculty['faculty_name']));
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedFac = newValue;
                                    });
                                  }),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                              controller: _acdyearController,
                              decoration: InputDecoration(
                                  hintText: "YYYY",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 2, 55, 98)))),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 22, horizontal: 70),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                onPressed: () {
                                  insertClass();
                                },
                                child: Text(
                                  "Insert",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Center(
              child: Text("Assign Table",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: DataTable(
                  columns: [
                    DataColumn(label: Text("Sl No")),
                    DataColumn(label: Text("Faculty")),
                    DataColumn(label: Text("Class")),
                    DataColumn(label: Text("Edit")),
                    DataColumn(label: Text("Delete")),
                  ],
                  rows: AssignList.asMap().entries.map((entry) {
                    return DataRow(cells: [
                      DataCell(Text((entry.key + 1).toString())),
                      DataCell(
                          Text(entry.value['tbl_faculty']['faculty_name'])),
                      DataCell(Text(entry.value['academic_year'])),
                      DataCell(IconButton(
                        icon: const Icon(Icons.edit, color: Colors.green),
                        onPressed: () {},
                      )),
                      DataCell(IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {},
                      ))
                    ]);
                  }).toList()),
            ),
          )
        ],
      ),
    );
  }
}

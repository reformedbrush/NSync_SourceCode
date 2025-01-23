import 'package:flutter/material.dart';
import 'package:nsync_admin/components/insert_form.dart';
import 'package:nsync_admin/main.dart';

class FacultyScreen extends StatefulWidget {
  const FacultyScreen({super.key});

  @override
  State<FacultyScreen> createState() => _FacultyScreenState();
}

class _FacultyScreenState extends State<FacultyScreen>
    with SingleTickerProviderStateMixin {
  bool _isFormVisible = false; // To manage form visibility
  String? selectedDept;
  List<Map<String, dynamic>> facultyList = [];
  List<Map<String, dynamic>> _deptList = [];

  final Duration _animationDuration = const Duration(milliseconds: 300);
  final TextEditingController _facultyController = TextEditingController();

  Future<void> insFaculty() async {
    try {
      String Faculty = _facultyController.text;
      if (selectedDept == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please select a Department"),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      await supabase
          .from('tbl_faculty')
          .insert({'faculty_name': Faculty, 'department_name': selectedDept});
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Faculty Data Inserted Sucessfully",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ));
      _facultyController.clear(); // reset inserted value after insertion
      setState(() {
        selectedDept = null; //reset selection
      });
    } catch (e) {
      print("ERROR INSERTING DATA: $e");
    }
  }

  Future<void> fetchDepartment() async {
    try {
      final response = await supabase.from('tbl_department').select();
      if (response != null && response is List<dynamic>) {
        print(response);
        setState(() {
          _deptList = response
              .map((item) => {
                    'department_id': item['department_id'].toString(),
                    'department_name': item['department_name'],
                  })
              .toList();
        });
      }
    } catch (e) {
      print("ERROR FETCHING DEPARTMENTS: $e");
    }
  }

  Future<void> fetchFaculty() async {
    try {
      final response =
          await supabase.from('tbl_faculty').select('*,tbl_department(*)');
      setState(() {
        facultyList = response;
      });
    } catch (e) {
      print("ERROR FETCHING FACULTY DATA: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDepartment();
    fetchFaculty();
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
              Text("Manage Faculty"),
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
                    "Add Faculty",
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
                    width: 500,
                    child: Row(
                      children: [
                        Expanded(
                            child: TextFieldStyle(
                          inputController: _facultyController,
                          label: "Faculty",
                        )),
                        Expanded(
                            child: DropdownButtonFormField<String>(
                                value: selectedDept,
                                items: items,
                                onChanged: onChanged))
                      ],
                    ),
                  ))
                : Container(),
          ),
          Container(
            height: 500,
            child: Center(
              child: Text("Faculty Data"),
            ),
          )
        ],
      ),
    );
  }
}

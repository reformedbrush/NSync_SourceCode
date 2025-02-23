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

  List<Map<String, dynamic>> DeptList = [];

  final Duration _animationDuration = const Duration(milliseconds: 300);

  final formKey = GlobalKey<FormState>();

  //fetch

  Future<void> fetchDept() async {
    try {
      final response = await supabase.from('tbl_assign').select();
      if (response.isNotEmpty) {
        setState(() {
          DeptList = response;
        });
      }
    } catch (e) {
      print("ERROR FETCHING DEPARTMENT: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    _isFormVisible ? "Cancel" : "Assign Student",
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
                ? Form(key: formKey, child: Container())
                : Container(
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
                                  }),
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
          )
        ],
      ),
    );
  }
}

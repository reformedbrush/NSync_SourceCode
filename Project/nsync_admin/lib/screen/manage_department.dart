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

  Future<void> insertDept() async {
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
    } catch (e) {
      print("ERROR ADDING DATA");
    }
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
                  onPressed: () {
                    setState(() {
                      _isFormVisible =
                          !_isFormVisible; // Toggle form visibility
                    });
                  },
                  label: Text("Add Department"),
                  icon: Icon(Icons.add),
                ),
              )
            ],
          ),
          AnimatedSize(
            duration: _animationDuration,
            curve: Curves.easeInOut,
            child: _isFormVisible
                ? Form(
                    child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: TextFieldStyle(
                            inputController: _deptController,
                            label: "Department",
                          )),
                          ElevatedButton(
                              onPressed: () {
                                insertDept();
                              },
                              child: Text("Insert"))
                        ],
                      )
                    ],
                  ))
                : Container(),
          ),
          Container(
            height: 500,
            child: Center(
              child: Text("Department Data"),
            ),
          )
        ],
      ),
    );
  }
}

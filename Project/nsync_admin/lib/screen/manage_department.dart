import 'package:flutter/material.dart';
import 'package:nsync_admin/components/insert_form.dart';

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
                              onPressed: () {}, child: Text("Insert"))
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

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nsync_faculty/screen/my_department.dart';

class Hostevent extends StatefulWidget {
  const Hostevent({super.key});

  @override
  State<Hostevent> createState() => _HosteventState();
}

class _HosteventState extends State<Hostevent> {
  //controllers

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _evForDateController = TextEditingController();
  final TextEditingController _evLastDateController = TextEditingController();

  //datepicker

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _evForDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    label: Text(
                      "Return",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF161616),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 18)),
                  )
                ],
              ),
              Container(
                width: 700,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Center(
                          child: Text(
                            "Request Event",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: TextFormField(
                              controller: _nameController,
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
                                      borderSide:
                                          BorderSide(color: Colors.blue))),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.all(8),
                          child: TextFormField(
                            controller: _evForDateController,
                            readOnly: true,
                            decoration: const InputDecoration(
                              labelText: "For Date",
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.calendar_today),
                            ),
                            onTap: () => _selectDate(context),
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

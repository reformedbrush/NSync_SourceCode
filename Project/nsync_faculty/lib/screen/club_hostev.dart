import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClubHostev extends StatefulWidget {
  const ClubHostev({super.key});

  @override
  State<ClubHostev> createState() => _ClubHostevState();
}

class _ClubHostevState extends State<ClubHostev> {
  //controller

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _evForDateController = TextEditingController();
  final TextEditingController _evLastDateController = TextEditingController();
  final TextEditingController _evDetailController = TextEditingController();
  final TextEditingController _evVenueController = TextEditingController();
  final TextEditingController _evParticipantsController =
      TextEditingController();

  //datepicker

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(), // Prevents past dates
      lastDate: DateTime.now().add(Duration(days: 365)), // Limits to 1 year
    );

    if (pickedDate != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 50),
                  ElevatedButton.icon(
                    icon: Icon(
                      Icons.reset_tv,
                      color: Colors.white,
                    ),
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
              SizedBox(height: 30),
              Container(
                width: 700,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "Request Club Event",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                  hintText: "Name",
                                  labelText: "Event Name",
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
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.all(8),
                          child: TextFormField(
                            controller: _evForDateController,
                            readOnly: true,
                            decoration: const InputDecoration(
                              labelText: "For_Date",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              suffixIcon: Icon(Icons.calendar_today),
                            ),
                            onTap: () =>
                                _selectDate(context, _evForDateController),
                          ),
                        )),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.all(8),
                          child: TextFormField(
                            controller: _evLastDateController,
                            readOnly: true,
                            decoration: const InputDecoration(
                              labelText: "Last_date",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              suffixIcon: Icon(Icons.calendar_today),
                            ),
                            onTap: () =>
                                _selectDate(context, _evLastDateController),
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
                            controller: _evVenueController,
                            decoration: InputDecoration(
                              hintText: "Venue",
                              labelText: "Venue",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                            ),
                          ),
                        )),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.all(8),
                          child: TextFormField(
                            controller: _evParticipantsController,
                            decoration: InputDecoration(
                              hintText: "Participants",
                              labelText: "Participants",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                            ),
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
                            controller: _evDetailController,
                            decoration: InputDecoration(
                              hintText: "Details",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                            ),
                            maxLines: 5,
                          ),
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
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () {
                              hostInsert();
                            },
                            child: Text(
                              "Send Request",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

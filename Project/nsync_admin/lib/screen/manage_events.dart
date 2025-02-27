import 'package:flutter/material.dart';
import 'package:nsync_admin/components/insert_form.dart';
import 'package:nsync_admin/main.dart';
import 'package:intl/intl.dart';
import 'package:nsync_admin/screen/requested_events.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen>
    with SingleTickerProviderStateMixin {
  bool _isFormVisible = false; // To manage form visibility
  final Duration _animationDuration = const Duration(milliseconds: 300);

  //controllers
  final TextEditingController _eventController = TextEditingController();
  final TextEditingController _evDetailController = TextEditingController();
  final TextEditingController _evVenueController = TextEditingController();
  final TextEditingController _evForDateController = TextEditingController();
  final TextEditingController _evLastDateController = TextEditingController();

  //list to store tbl data
  List<Map<String, dynamic>> EventList = [];

  //insert
  Future<void> eventInsert() async {
    try {
      String Name = _eventController.text;
      String Details = _evDetailController.text;
      String Venue = _evVenueController.text;
      String ForDate = _evForDateController.text;
      String LastDate = _evLastDateController.text;
      await supabase.from('tbl_events').insert({
        'event_name': Name,
        'event_details': Details,
        'event_venue': Venue,
        'event_fordate': ForDate,
        'event_lastdate': LastDate,
        'event_status': 1 // to auto approve events added by admin
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Event Details Inserted Sucessfully",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ));
      _eventController.clear();
      _evDetailController.clear();
      _evVenueController.clear();
      _evForDateController.clear();
      _evLastDateController.clear();
    } catch (e) {
      print("ERROR INSERTING DATA: $e");
    }
  }

  //Select

  Future<void> fetchEvents() async {
    try {
      final response =
          await supabase.from('tbl_events').select().eq('event_status', 1);
      setState(() {
        EventList = response;
      });
      fetchEvents();
    } catch (e) {
      print("ERROR FETCHING DATA: $e");
    }
  }

  //Edit

  int eid = 0;

  Future<void> editEvent() async {
    try {
      await supabase.from('tbl_events').update({
        'event_name': _eventController.text,
        'event_venue': _evVenueController.text,
        'event_details': _evDetailController.text,
        'event_fordate': _evForDateController.text,
        'event_lastdate': _evLastDateController.text
      }).eq('event_id', eid);
      fetchEvents();
      _eventController.clear();
      _evDetailController.clear();
      _evVenueController.clear();
      _evForDateController.clear();
      _evLastDateController.clear();
    } catch (e) {
      print("ERROR UPDATING DATA: $e");
    }
  }

  //Delete

  Future<void> DelEvent(String did) async {
    try {
      await supabase.from("tbl_events").delete().eq("event_id", did);
      fetchEvents();
    } catch (e) {
      print("ERROR: $e");
    }
  }

  //select date

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
  void initState() {
    super.initState();
    fetchEvents();
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
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RequestedEvents()));
                    },
                    label: Text(
                      "Event Requests",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF161616),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 18)),
                    icon: Icon(
                      Icons.new_label,
                      color: Colors.white,
                    ),
                  )),
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
                    _isFormVisible ? "Cancel" : "Add Events",
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
                    child: SizedBox(
                    width: 700,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFieldStyle(
                                inputController: _eventController,
                                label: "Event Name",
                              ),
                            )),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(8),
                              child: TextFieldStyle(
                                label: "Venue",
                                inputController: _evVenueController,
                              ),
                            )),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(8),
                              child: TextFieldStyle(
                                  label: "Event Details",
                                  inputController: _evDetailController),
                            )),
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
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
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
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  suffixIcon: Icon(Icons.calendar_today),
                                ),
                                onTap: () =>
                                    _selectDate(context, _evLastDateController),
                              ),
                            ))
                          ],
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: EdgeInsets.symmetric(
                                    vertical: 22, horizontal: 70),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () {
                              if (eid == 0) {
                                eventInsert();
                              } else {
                                editEvent();
                              }
                            },
                            child: Text(
                              "Insert",
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                  ))
                : Container(),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Center(
              child: Text("Events Table",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: DataTable(
                  columns: [
                    DataColumn(label: Text("Sl No")),
                    DataColumn(label: Text("Event")),
                    DataColumn(label: Text("Venue")),
                    DataColumn(label: Text("Details")),
                    DataColumn(label: Text("For Date")),
                    DataColumn(label: Text("Last Date")),
                    DataColumn(label: Text("Edit")),
                    DataColumn(label: Text("Delete"))
                  ],
                  rows: EventList.asMap().entries.map((entry) {
                    return DataRow(cells: [
                      DataCell(Text((entry.key + 1).toString())),
                      DataCell(Text(entry.value['event_name'])),
                      DataCell(Text(entry.value['event_venue'])),
                      DataCell(Text(entry.value['event_details'])),
                      DataCell(Text(entry.value['event_fordate'])),
                      DataCell(Text(entry.value['event_lastdate'])),
                      DataCell(IconButton(
                        icon: const Icon(Icons.edit, color: Colors.green),
                        onPressed: () {
                          setState(() {
                            _evForDateController.text =
                                entry.value['event_fordate'];
                            _evLastDateController.text =
                                entry.value['event_lastdate'];
                            _eventController.text = entry.value['event_name'];
                            _evDetailController.text =
                                entry.value['event_details'];
                            _evVenueController.text =
                                entry.value['event_venue'];

                            eid = entry.value['event_id'];
                            _isFormVisible = true;
                            print(eid);
                          });
                        },
                      )),
                      DataCell(IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          DelEvent(entry.value['event_id'].toString());
                          //delete function
                        },
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

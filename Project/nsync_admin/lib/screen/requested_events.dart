import 'package:flutter/material.dart';
import 'package:nsync_admin/main.dart';

class RequestedEvents extends StatefulWidget {
  const RequestedEvents({super.key});

  @override
  State<RequestedEvents> createState() => _RequestedEventsState();
}

class _RequestedEventsState extends State<RequestedEvents> {
  List<Map<String, dynamic>> EventList = [];

  //select

  Future<void> fetchEvents() async {
    try {
      final response =
          await supabase.from('tbl_events').select().eq('event_status', 0);
      setState(() {
        EventList = response;
      });
      fetchEvents();
    } catch (e) {
      print("ERROR FETCHING DATA: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 20,
                ),
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
                  icon: Icon(
                    Icons.reset_tv,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Center(
              child: Text(
                "Requested Events",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 30,
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
/*                     DataColumn(label: Text("Dept/Club")),
 */
                    DataColumn(label: Text("Accept")),
                    DataColumn(label: Text("Reject"))
                  ],
                  rows: EventList.asMap().entries.map((entry) {
                    return DataRow(cells: [
                      DataCell(Text((entry.key + 1).toString())),
                      DataCell(Text(entry.value['event_name'])),
                      DataCell(Text(entry.value['event_venue'])),
                      DataCell(Text(entry.value['event_details'])),
                      DataCell(Text(entry.value['event_fordate'])),
                      DataCell(Text(entry.value['event_lastdate'])),
/*                       DataCell(Text(entry.value['department_id'])),
 */
                      DataCell(IconButton(
                        icon: const Icon(Icons.check, color: Colors.green),
                        onPressed: () {},
                      )),
                      DataCell(IconButton(
                        icon: const Icon(Icons.close, color: Colors.red),
                        onPressed: () {
/*                           DelEvent(entry.value['event_id'].toString());
 */ //delete function
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

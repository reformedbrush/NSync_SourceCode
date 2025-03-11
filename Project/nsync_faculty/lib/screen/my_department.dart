import 'package:flutter/material.dart';
import 'package:nsync_faculty/main.dart';
import 'package:nsync_faculty/screen/host_event.dart';

class MyDepartment extends StatefulWidget {
  const MyDepartment({super.key});

  @override
  State<MyDepartment> createState() => _MyDepartmentState();
}

class _MyDepartmentState extends State<MyDepartment> {
  List<Map<String, dynamic>> eventList = [];

  // select

  Future<void> fetchEvents() async {
    try {
      final response =
          await supabase.from('tbl_events').select().eq("event_status", 1);
      setState(() {
        eventList = response;
      });
    } catch (e) {
      print("ERROR FETCHING EVENTS: $e");
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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Hostevent()));
                  },
                  label: Text(
                    "Host Event",
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
            SizedBox(height: 50),
            Text(
              "Department Events",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: eventList.length,
                itemBuilder: (context, index) {
                  final event = eventList[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: (Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 241, 241, 241),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /* Image.asset(event                        ), */
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(event['event_name'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(event['event_venue'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis)),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(event['event_details'],
                                maxLines: 2, overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                    )),
                  );
                })
          ],
        ),
      ),
    );
  }
}

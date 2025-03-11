import 'package:flutter/material.dart';
import 'package:nsync_admin/main.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List<Map<String, dynamic>> eventList = [];

  //select

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
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    colors: [const Color(0xFF1F4037), Color(0xFF99F2C8)],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft)),
            width: 1250,
            height: 90,
            child: Padding(
              padding: const EdgeInsets.only(top: 27, left: 20),
              child: Text(
                "Welcome Admin",
                style: TextStyle(
                    color: Color(0xFF1F4037),
                    fontSize: 25,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffeeeeeee),
                      ),
                      width: 700,
                      height: 500,
                      child: Column(
                        children: [
                          SingleChildScrollView(),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, left: 5, right: 5),
                            child: Center(
                              child: Text(
                                "Upcoming Events",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: eventList.length,
                                itemBuilder: (context, index) {
                                  final event = eventList[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: (Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          /* Image.asset(event                        ), */
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(event['event_name'],
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                              child: Text(event['event_venue'],
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis)),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(event['event_details'],
                                                maxLines: 2,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          )
                                        ],
                                      ),
                                    )),
                                  );
                                }),
                          ),
                        ],
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffeeeeeee),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 500,
                  width: 530,
                  child: Text("Other"),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffeeeeeee),
            ),
            height: 500,
            width: 500,
            child: Text("data"),
          )
        ],
      ),
    );
  }
}

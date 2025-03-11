import 'package:flutter/material.dart';
import 'package:nsync_student/main.dart';

class StuClub extends StatefulWidget {
  const StuClub({super.key});

  @override
  State<StuClub> createState() => _StuClubState();
}

class _StuClubState extends State<StuClub> {
  List<Map<String, dynamic>> Clublist = [];

  //select

  Future<void> fecthClub() async {
    try {
      final response = await supabase.from('tbl_club').select();
      setState(() {
        Clublist = response;
      });
    } catch (e) {
      print("ERROR FETCHING CLUB: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fecthClub();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: Clublist.length,
                    itemBuilder: (context, index) {
                      final club = Clublist[index];

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
                                child: Text(club['club_name'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ),
                              /* Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(club['event_venue'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis)),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(club['event_details'],
                                  maxLines: 2, overflow: TextOverflow.ellipsis),
                            ) */
                            ],
                          ),
                        )),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF161616),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(
                            horizontal: 150, vertical: 18)),
                    onPressed: () {},
                    child: Text("Join Clubs"))
              ],
            ),
          ),
        ));
  }
}

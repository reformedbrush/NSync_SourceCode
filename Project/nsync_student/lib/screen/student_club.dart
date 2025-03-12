import 'package:flutter/material.dart';
import 'package:nsync_student/main.dart';
import 'package:nsync_student/screen/join_clubs.dart';

class StudentClub extends StatefulWidget {
  const StudentClub({super.key});

  @override
  State<StudentClub> createState() => _StudentClubState();
}

class _StudentClubState extends State<StudentClub> {
  List<Map<String, dynamic>> clubList = [];

  //select

  Future<void> evFetc() async {
    try {
      final response = await supabase.from('tbl_club').select();
      setState(() {
        clubList = response;
      });
    } catch (e) {
      print("ERROR FETCHING CLUBS: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    evFetc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text("My Clubs"),
            ),
            Column(
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: clubList.length,
                    itemBuilder: (context, index) {
                      final club = clubList[index];
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: (Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 242, 242, 242),
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
                                  child: Text(club['_venue'],
                                      maxLines: 2, overflow: TextOverflow.ellipsis)),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(club['event_details'],
                                    maxLines: 2, overflow: TextOverflow.ellipsis),
                              ) */
                            ],
                          ),
                        )),
                      );
                    }),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF161616),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 18)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => JoinClubs()));
                          },
                          child: Text('Join Clubs',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20))),
                    )),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

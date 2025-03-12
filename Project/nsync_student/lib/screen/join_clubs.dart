import 'package:flutter/material.dart';
import 'package:nsync_student/main.dart';

class JoinClubs extends StatefulWidget {
  const JoinClubs({super.key});

  @override
  State<JoinClubs> createState() => _JoinClubsState();
}

class _JoinClubsState extends State<JoinClubs> {
  List<Map<String, dynamic>> clubList = [];

  //select

  Future<void> fetchClub() async {
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
    fetchClub();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text("Join Clubs"),
            ),
            SizedBox(
              height: 50,
            ),
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
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(club['club_name'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ),
                          ElevatedButton(onPressed: () {}, child: Text("Join"))
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

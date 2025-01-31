import 'package:flutter/material.dart';
import 'package:nsync_admin/components/insert_form.dart';
import 'package:nsync_admin/main.dart';

class ClubsScreen extends StatefulWidget {
  const ClubsScreen({super.key});

  @override
  State<ClubsScreen> createState() => _ClubsScreenState();
}

class _ClubsScreenState extends State<ClubsScreen>
    with SingleTickerProviderStateMixin {
  bool _isFormVisible = false; // To manage form visibility
  final Duration _animationDuration = const Duration(milliseconds: 300);

  final TextEditingController _clubController = TextEditingController();

// list to store tbl data for displaying
  List<Map<String, dynamic>> Clublist = [];

//insert
  Future<void> insertClub() async {
    try {
      String club = _clubController.text;
      await supabase.from("tbl_club").insert({
        "club_name": club,
      });
      fetchClub();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //Data added message
        content: Text(
          "Data Added",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
      ));
    } catch (e) {
      print("ERROR ADDDING DATA: $e");
    }
  }

//display
  Future<void> fetchClub() async {
    try {
      final response = await supabase.from('tbl_club').select();
      setState(() {
        Clublist = response;
      });
    } catch (e) {
      print("ERROR FETCHING DATA: $e");
    }
  }

//delete
  Future<void> delCLub(String did) async {
    try {
      await supabase.from('tbl_club').delete().eq("club_id", did);
      fetchClub();
    } catch (e) {
      print("ERROR: $e");
    }
  }

  //edit
  int eid = 0;

  Future<void> editclub() async {
    try {
      await supabase
          .from('tbl_club')
          .update({'club_name': _clubController.text}).eq('club_id', eid);
      fetchClub();
      _clubController.clear();
    } catch (e) {
      print("ERROR: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchClub();
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
              Text("Manage Clubs"),
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
                    _isFormVisible ? "Cancel" : "Add Club",
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
                    child: Container(
                    width: 700,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFieldStyle(
                                inputController: _clubController,
                                label: "Club",
                              ),
                            )),
                          ],
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF017AFF),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 70, vertical: 22),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () {
                              if (eid == 0) {
                                insertClub();
                              } else {
                                editclub();
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
          Container(
            child: Center(
              child: Text("Clubs Table",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 249, 249, 249),
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(6),
            ),
            height: 500,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: DataTable(
                  columns: [
                    DataColumn(label: Text("Sl.No")),
                    DataColumn(label: Text("Club")),
                    DataColumn(label: Text("Edit")),
                    DataColumn(label: Text("Delete"))
                  ],
                  rows: Clublist.asMap().entries.map((entry) {
                    print(entry.value);
                    return DataRow(cells: [
                      DataCell(Text((entry.key + 1).toString())),
                      DataCell(Text(entry.value['club_name'])),
                      DataCell(IconButton(
                        icon: const Icon(Icons.edit, color: Colors.green),
                        onPressed: () {
                          setState(() {
                            _clubController.text = entry.value['club_name'];
                            eid = entry.value['club_id'];
                            _isFormVisible = !_isFormVisible;
                          });
                        },
                      )),
                      DataCell(IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          delCLub(entry.value['club_id'].toString());
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

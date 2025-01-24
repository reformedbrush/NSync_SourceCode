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

  Future<void> insertClub() async {
    try {
      String club = _clubController.text;
      await supabase.from("tbl_club").insert({
        "club_name": club,
      });
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
                  onPressed: () {
                    setState(() {
                      _isFormVisible =
                          !_isFormVisible; // Toggle form visibility
                    });
                  },
                  label: Text("Add Club"),
                  icon: Icon(Icons.add),
                ),
              )
            ],
          ),
          AnimatedSize(
            duration: _animationDuration,
            curve: Curves.easeInOut,
            child: _isFormVisible
                ? Form(
                    child: Row(
                    children: [
                      Expanded(
                          child: TextFieldStyle(
                        inputController: _clubController,
                        label: "Club",
                      )),
                      ElevatedButton(
                          onPressed: () {
                            insertClub();
                          },
                          child: Text("Insert"))
                    ],
                  ))
                : Container(),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(6),
            ),
            height: 500,
            width: 400,
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
                        onPressed: () {},
                      )),
                      DataCell(IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
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

import 'package:flutter/material.dart';
import 'package:nsync_admin/components/insert_form.dart';

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
                      ElevatedButton(onPressed: () {}, child: Text("Insert"))
                    ],
                  ))
                : Container(),
          ),
          Container(
            height: 500,
            child: Center(
              child: Text("Clubs Data"),
            ),
          )
        ],
      ),
    );
  }
}

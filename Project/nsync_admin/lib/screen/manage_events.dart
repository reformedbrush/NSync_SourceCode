import 'package:flutter/material.dart';
import 'package:nsync_admin/components/insert_form.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen>
    with SingleTickerProviderStateMixin {
  bool _isFormVisible = false; // To manage form visibility
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final TextEditingController _eventController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Manage Events"),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _isFormVisible =
                          !_isFormVisible; // Toggle form visibility
                    });
                  },
                  label: Text("Add Events"),
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
                        inputController: _eventController,
                        label: "Events",
                      )),
                      ElevatedButton(onPressed: () {}, child: Text("Insert"))
                    ],
                  ))
                : Container(),
          ),
          SizedBox(
            height: 500,
            child: Center(
              child: Text("Events Data"),
            ),
          )
        ],
      ),
    );
  }
}

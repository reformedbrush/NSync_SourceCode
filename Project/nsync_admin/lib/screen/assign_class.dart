import 'package:flutter/material.dart';

class AssignClass extends StatefulWidget {
  const AssignClass({super.key});

  @override
  State<AssignClass> createState() => _AssignClassState();
}

class _AssignClassState extends State<AssignClass>
    with SingleTickerProviderStateMixin {
  bool _isFormVisible = false;

  final Duration _animationDuration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF161616),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 18)),
                    onPressed: () {
                      setState(() {
                        _isFormVisible = !_isFormVisible;
                      });
                    },
                    label: Text(_isFormVisible ? "Cancel" : "Assign Class",
                        style: TextStyle(color: Colors.white)),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

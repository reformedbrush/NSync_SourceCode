import 'package:flutter/material.dart';

class TextFieldStyle extends StatelessWidget {
  final TextEditingController inputController;
  final String label;

  const TextFieldStyle(
      {super.key, required this.label, required this.inputController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      decoration: InputDecoration(
          hintText: label,
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF1F4037)))),
    );
  }
}

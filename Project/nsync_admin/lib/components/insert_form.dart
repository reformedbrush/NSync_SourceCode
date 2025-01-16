import 'package:flutter/material.dart';

class TextFieldStyle extends StatefulWidget {
  const TextFieldStyle({super.key});

  @override
  State<TextFieldStyle> createState() => _TextFieldStyleState();
}

class _TextFieldStyleState extends State<TextFieldStyle> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Enter Data",
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF1F4037)))),
    );SizedBox(height: 100,)
  }
}

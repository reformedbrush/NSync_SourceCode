import 'package:flutter/material.dart';

class NewsLetterScreen extends StatefulWidget {
  const NewsLetterScreen({super.key});

  @override
  State<NewsLetterScreen> createState() => _NewsLetterScreenState();
}

class _NewsLetterScreenState extends State<NewsLetterScreen>
    with SingleTickerProviderStateMixin {
  bool _isFormVisible = false;

  final Duration _animationDuration = const Duration(milliseconds: 300);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Post Newsletter"),
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
                  label: Text(
                    _isFormVisible ? "Cancel" : "New Newsletter",
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
                      child: Container(),
                    )
                  : Container())
        ],
      ),
    );
  }
}

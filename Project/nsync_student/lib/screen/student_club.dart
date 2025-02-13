import 'package:flutter/material.dart';

class StuClub extends StatelessWidget {
  const StuClub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 233, 233, 233),
                      borderRadius: BorderRadius.circular(5)),
                  child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                        "Event 1",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("DJ Auditorium"),
                      trailing: const Icon(
                        Icons.message,
                        color: Colors.blue,
                      )),
                ),
              )
            ],
          ),
        ));
  }
}

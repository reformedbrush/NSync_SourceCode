import 'package:flutter/material.dart';

class StuEvents extends StatefulWidget {
  const StuEvents({super.key});

  @override
  State<StuEvents> createState() => _StuEventsState();
}

class _StuEventsState extends State<StuEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 350,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255)),
                child: Image.asset("./assets/Miroodles.png")),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 244, 244)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListTile(
                    leading: Icon(Icons.abc_outlined),
                    title: Text(
                      "Event 1",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("@DJ hall"),
                    trailing: Icon(Icons.touch_app),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 244, 244)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListTile(
                    leading: Icon(Icons.abc_outlined),
                    title: Text(
                      "Event 1",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("@DJ hall"),
                    trailing: Icon(Icons.touch_app),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 244, 244)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListTile(
                    leading: Icon(Icons.abc_outlined),
                    title: Text(
                      "Event 1",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("@DJ hall"),
                    trailing: Icon(Icons.touch_app),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 244, 244)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListTile(
                    leading: Icon(Icons.abc_outlined),
                    title: Text(
                      "Event 1",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("@DJ hall"),
                    trailing: Icon(Icons.touch_app),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 244, 244)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListTile(
                    leading: Icon(Icons.abc_outlined),
                    title: Text(
                      "Event 1",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("@DJ hall"),
                    trailing: Icon(Icons.touch_app),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 244, 244)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListTile(
                    leading: Icon(Icons.abc_outlined),
                    title: Text(
                      "Event 1",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("@DJ hall"),
                    trailing: Icon(Icons.touch_app),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

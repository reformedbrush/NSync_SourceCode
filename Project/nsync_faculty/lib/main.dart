import 'package:nsync_faculty/screen/facultyhome.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:flutter/material.dart';
import 'package:nsync_faculty/screen/login.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://gxomwkpwoxmhdtdsxjph.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd4b213a3B3b3htaGR0ZHN4anBoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQzNDU5ODAsImV4cCI6MjA0OTkyMTk4MH0.AksgXgzqkpAGnGxsypvcaotmPeFSdytlAalMljjdLdw',
  );
  runApp(const MainApp());
}

final supabase = Supabase.instance.client;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Facultyhome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

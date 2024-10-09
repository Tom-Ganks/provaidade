import 'package:flutter/material.dart';
import 'package:flutter_application_p/liferapp.dart';

void main() {
  runApp(const LiferApp());
}

class LiferApp extends StatelessWidget {
  const LiferApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'LiferappPage',
      home: LiferAppPage(),
    );
  }
}

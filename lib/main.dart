import 'package:flutter/material.dart';
import 'package:mmagym_mobile/view/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "MMA Gym",
      home: Register(),
    );
  }
}

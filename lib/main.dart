import 'package:flutter/material.dart';
import 'package:mmagym_mobile/view/home/home.dart';
import 'package:mmagym_mobile/view/login/login.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (p0, p1, p2) {
      return const MaterialApp(
        
      debugShowCheckedModeBanner: false,
      title: "MMA Gym",
      home: Login(),
    );
    },); 
    
  }
}

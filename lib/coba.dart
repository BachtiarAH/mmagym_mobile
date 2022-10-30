// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Responsive Sizer Example',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Home(),
        );
      },
      maxTabletWidth: 900, // Optional
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    late final String screenTypeText;

    switch (Device.screenType) {
      case ScreenType.mobile:
        screenTypeText = "My screen's type is Mobile";
        break;
      case ScreenType.tablet:
        screenTypeText = "My screen's type is Tablet";
        break;
      // ScreenType can only be desktop when `maxTabletWidth`
      // is set in `ResponsiveSizer`
      case ScreenType.desktop:
        screenTypeText = "My screen's type is Desktop";
        break;
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: Adaptive.h(12.5), // or 12.5.h
            width: 50.w, // or Adaptive.w(50)
            color: Colors.black,
          ),
          Text(
            "This text is responsive",
            style: TextStyle(fontSize: 18.sp), // or Adaptive.sp(12)
          ),
          Text(
            "w=${100.w} h=${100.h}",
            style: TextStyle(fontSize: 12.sp),
          ),
          Device.orientation == Orientation.portrait
              ? const Text("My orientation is Portrait")
              : const Text("My orientation is Landscape"),
          Text(screenTypeText),
        ],
      ),
    );
  }
}

class tes extends StatelessWidget {
  const tes({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 200,
          child: ListView(),
        )
      ],
    );
  }
}
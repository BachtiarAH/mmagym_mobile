// import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    //data
    var data = ["Dada Menegah", "Dada lanjutan", "dada pemula"];

    //list widget
    List<Widget> listLatihan = [];

    //dimensional
    double ContMenuLatHeigh = Adaptive.h(39.5);
    double CardMenuLatHeigh = ContMenuLatHeigh * 40 / 100;

    double CardMenuLatihanWidth = Adaptive.w(95);

    double LayoutRiwayatHeigh = Adaptive.h(30);
    double LayoutRiwayatWidth = Adaptive.w(100);

    //fill widget menu latihan
    fillListLatiahan({required List<String> data}) {
      listLatihan.add(Container(
          margin: const EdgeInsets.only(top: 12, left: 17),
          child: const Text(
            "Menu Latihan",
            style: TextStyle(fontSize: 20),
          )));
      for (var i = 0; i < data.length; i++) {
        listLatihan.add(Container(
          decoration: const BoxDecoration(
            boxShadow: [
              // BoxShadow(
              //   spreadRadius: 2,
              //   blurStyle: BlurStyle.normal,
              //   offset: Offset(0, 5),
              //   color: Colors.grey
              // )
            ],
          ),
          margin: EdgeInsets.only(left: 4.5.w, top: 3.h),
          height: CardMenuLatHeigh,
          width: CardMenuLatihanWidth,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: CardMenuLatihanWidth,
                height: CardMenuLatHeigh,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(0),
                  ),
                  color: Color(0xff434343),
                ),
                padding: const EdgeInsets.only(
                  left: 111,
                  right: 4,
                  top: 10,
                  bottom: 9,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 150.13,
                      child: Text(
                        data[i],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 13),
                    const SizedBox(
                      width: 33.60,
                      child: Text(
                        "chest",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(height: 13),
                    const SizedBox(
                      width: 75.59,
                      child: Text(
                        "intermediete",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 95.54,
                    height: 91,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: const FlutterLogo(size: 91),
                  ),
                ),
              ),
            ],
          ),
        ));
      }
    }

    setState(() {
      fillListLatiahan(data: data);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MMA GYM",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.qr_code_scanner_outlined)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.person))],
      ),
      body: ListView(
        children: [
          //menu latiha
          Container(
              height: ContMenuLatHeigh, // or 12.5.h
              // width: 50.w,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0xE6E6E6E6),
                  ),
                  BoxShadow(
                    offset: Offset(1, 2),
                    blurRadius: 5,
                    spreadRadius: 2,
                    color: Colors.grey,
                    inset: true,
                  ),
                ],
              ),
              child: Container(
                alignment: Alignment.topRight,
                child: ListView(
                  shrinkWrap: true,
                  children: listLatihan,
                ),
              )),

          //pemisah
          Padding(padding: EdgeInsets.only(top: 1.h)),

          //jadwal
          Container(
            height: Adaptive.h(29.43), // or 12.5.h
            width: 50.w,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Color(0xE6E6E6E6),
                ),
                BoxShadow(
                  offset: Offset(1, 2),
                  blurRadius: 5,
                  spreadRadius: 2,
                  color: Colors.grey,
                  inset: true,
                ),
              ],
            ),
          ),

          //pemisah
          Padding(padding: EdgeInsets.only(top: 1.h)),

          //riwayat
          Container(
              width: LayoutRiwayatWidth,
              height: LayoutRiwayatHeigh,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(0xE6E6E6E6),
                    ),
                    BoxShadow(
                      offset: Offset(1, 2),
                      blurRadius: 5,
                      spreadRadius: 2,
                      color: Colors.grey,
                      inset: true,
                    )
                  ]))
        ],
      ),
    );
  }
}

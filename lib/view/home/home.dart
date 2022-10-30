// import 'package:flutter/material.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    late final String screenTypeText;
    double height = MediaQuery.of(context).size.height;
    double widthSc = MediaQuery.of(context).size.width;

    //dimensional
    double ContMenuLatHeigh = Adaptive.h(28.5);
    double CardMenuLatHeigh = ContMenuLatHeigh * 40 / 100;

    double CardMenuWidth = ;

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
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 12, left: 17),
                        child: Text(
                          "Menu Latihan",
                          style: TextStyle(fontSize: 20),
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 4.5.w),
                      height: CardMenuLatHeigh,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            
                            height: CardMenuLatHeigh,
                            decoration: BoxDecoration(
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
                                    "Dada Menengah",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 13),
                                SizedBox(
                                  width: 33.60,
                                  child: Text(
                                    "chest",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 13),
                                SizedBox(
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
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(0),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(0),
                                  ),
                                ),
                                child: FlutterLogo(size: 91),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 30,
                      color: Colors.amber,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 30,
                      color: Colors.amber,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 30,
                      color: Colors.amber,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 30,
                      color: Colors.amber,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 30,
                      color: Colors.amber,
                    ),
                  ],
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
        ],
      ),
    );
  }
}

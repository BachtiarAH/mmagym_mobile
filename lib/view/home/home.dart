// import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:mmagym_mobile/clien/MenuLatihanClient.dart';
import 'package:mmagym_mobile/models/MenuLatihanModel.dart';
import 'package:mmagym_mobile/view/home/Profil.dart';
import 'package:mmagym_mobile/view/home/QrScanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:mmagym_mobile/view/mainMenu/menu_latihan.dart';
import 'package:mmagym_mobile/view/mainMenu/menu_latihan.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MenuLatihanClien restClient = MenuLatihanClien();
  var data = List<String>;
  late Future<MenuLatihanModel> MenuModel;

  //dimensional
  double ContMenuLatHeigh = Adaptive.h(39.5);
  // ignore: unnecessary_this
  double CardMenuLatHeigh() => ContMenuLatHeigh * 40 / 100;

  double CardMenuLatihanWidth = Adaptive.w(95);
  double CardMenulatihanImgHigh() => CardMenuLatHeigh();

  double JadualHeigh = Adaptive.h(29.43);
  double JadualWidth = 100.w;
  double CardJadualHeigh() => JadualHeigh * 64 / 100;
  double CardJadualWidth() => JadualWidth * 30 / 100;

  double LayoutRiwayatHeigh = Adaptive.h(30);
  double LayoutRiwayatWidth = Adaptive.w(100);

  @override
  void initState() {
    // TODO: implement initState
    MenuModel = restClient.getMenuLatihan();
    super.initState();
  }

  Widget createCardMenuLatihan(
      {required id,
      required String NamaMenu,
      required String level,
      required String partBadan,
      required String idFoto}) {
    return Container(
      margin: EdgeInsets.only(left: 4.5.w, top: 3.h),
      height: CardMenuLatHeigh(),
      width: CardMenuLatihanWidth,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            width: CardMenuLatihanWidth,
            height: CardMenuLatHeigh(),
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
                Container(
                  width: CardMenuLatihanWidth - CardMenuLatHeigh(),
                  alignment: Alignment.topLeft,
                  child: Text(
                    NamaMenu,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: CardMenuLatHeigh() * 20 / 100),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    partBadan,
                    style:  TextStyle(
                      color: Colors.white,
                      fontSize: 0.1 * CardMenuLatHeigh(),
                    ),
                  ),
                ),
                SizedBox(height: 0.1 * CardMenuLatHeigh()),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    level,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 0.1 * CardMenulatihanImgHigh(),
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
                width: CardMenuLatHeigh(),
                height: CardMenuLatHeigh(),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                child: Image.network(
                    "https://drive.google.com/uc?export=view&id=$idFoto",scale: 1/1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    

    //data
    var data = ["Dada Menegah", "Dada lanjutan", "dada pemula"];
    var hari = [
      ["Senin", "Dada Menegah"],
      ["Selasa", "Istirahat"],
      ["Rabu", "Kaki Menengah"],
      ["Kamis", "Istirahat"],
      ["Jumat", "Istirahat"],
      ["Sabtu", "Punggung Mengah"],
      ["Minggu", "Istirahat"]
    ];
    var Riwayat = [
      ["", "Nama", "catatan", "rep", "set"],
      ["", "Bench Press", "10 Kg", "10", "2"],
      ["", "diamond pushup", "slow down fast up", "10", "2"],
      ["", "Chest Press", "10 Kg", "10", "2"],
      ["", "leg Press", "15 Kg", "10", "2"],
      ["", "shoulder press Press", "5 Kg", "10", "2"],
    ];

    //list widget
    List<Widget> listLatihan = [];

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
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => QrScanner(),
              ));
            },
            icon: const Icon(Icons.qr_code_scanner_outlined)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Profil(),
                ));
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: ListView(
        children: [
          //menu latiha
          Container(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MenuLatihan(),
                ));
              },
              child: Text(
                "Main Menu",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
              height: ContMenuLatHeigh, // or 12.5.h
              // width: 50.w,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
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
                  child: FutureBuilder(
                      future: MenuModel,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.body.length,
                            itemBuilder: (context, index) {
                              return createCardMenuLatihan(
                                  id: snapshot.data!.body[index].id,
                                  NamaMenu: snapshot.data!.body[index].nama,
                                  level: snapshot.data!.body[index].level,
                                  partBadan:
                                      snapshot.data!.body[index].bodyPart,
                                      idFoto: snapshot.data!.body[index].gambar);
                            },
                          );
                        } else if (snapshot.hasError) {
                          print("has Error ${snapshot.error}");
                          return Text("error");
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }))),

          //pemisah
          Padding(padding: EdgeInsets.only(top: 1.h)),

          //jadwal
          Stack(
            fit: StackFit.passthrough,
            children: [
              Container(
                height: JadualHeigh, // or 12.5.h
                width: JadualWidth,
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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hari.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 57,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 3.w),
                            width: CardJadualWidth(),
                            height: CardJadualHeigh(),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Color(0xE6E6E6E6),
                                  ),
                                  BoxShadow(
                                    offset: Offset(1, 2),
                                    blurRadius: 5,
                                    spreadRadius: 2,
                                    color: Colors.grey,
                                    inset: false,
                                  ),
                                ]),
                            child: Stack(
                              children: [
                                //gambar
                                Positioned.fill(
                                  child: FlutterLogo(size: 113),
                                ),

                                //menu latihan
                                Positioned(
                                  // left: CardJadualWidth * 50/100,
                                  bottom: 2,
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    width: CardJadualWidth(),
                                    child: Text(
                                      hari[index][1],
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),

                                //hari
                                Positioned(
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      hari[index][0],
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ],
                    );
                  },
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 4.5.w, top: 2.h),
                  child: Text(
                    "Jadual",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
            ],
          ),

          //pemisah
          Padding(padding: EdgeInsets.only(top: 1.h)),

          //riwayat
          Container(
            width: LayoutRiwayatWidth,
            height: LayoutRiwayatHeigh,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
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
                ]),
            child: ListView.builder(
              itemCount: Riwayat.length + 1,
              itemBuilder: (context, index) {
                if (index < 1) {
                  return Container(
                      margin: EdgeInsets.only(left: 4.5.w, top: 2.h),
                      child: Text(
                        "Riwayat Latihan",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ));
                } else {
                  return ListTile(
                    
                    leading: FlutterLogo(size: 40),
                    title: Text(Riwayat[index - 1][1]),
                    subtitle: Text(Riwayat[index - 1][2]),
                    trailing: Column(
                      children: [
                        Text(Riwayat[index - 1][3]),
                        Text(Riwayat[index - 1][4])
                      ],
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

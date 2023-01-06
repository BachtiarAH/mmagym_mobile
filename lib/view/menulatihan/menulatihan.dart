import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mmagym_mobile/clien/JadwalClient.dart';
import 'package:mmagym_mobile/clien/MenuLatihanClient.dart';
import 'package:mmagym_mobile/clien/RiwayatClient.dart';
import 'package:mmagym_mobile/clien/isiMenuLatihanClient.dart';
import 'package:mmagym_mobile/models/IsiMenuModel.dart';
import 'package:mmagym_mobile/models/MenuLatihanModel.dart';
import 'package:mmagym_mobile/models/StatusMessage.dart';
import 'package:mmagym_mobile/view/home/Profil.dart';
import 'package:mmagym_mobile/view/menulatihan/videoPlayer2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class menulatihan extends StatefulWidget {
  var idMenu;

  menulatihan({super.key, required this.idMenu});

  @override
  State<menulatihan> createState() => _menulatihanState(idMenu);
}

class _menulatihanState extends State<menulatihan> {
  String? _valhari;
  late Future<RincianMenuModel> model;
  // late Future<MenuLatihanModel> modelMenu;
  // late IsiMenu modelNF;
  // late MenuLatihanClien clientMenu = new MenuLatihanClien();
  late IsiMEnuLatihanClient client = new IsiMEnuLatihanClient();
  late String idVideo = '';
  late videoPlayer2 video;
  late var _idMenu;
  late VideoPlayerController _controller;
  bool videoIsInitilized = false;

  late StatusMessage modelSt;
  JadwalClient jadwalClient = JadwalClient();
  RiwayatCLient riwayatCLient = RiwayatCLient();

  _menulatihanState(id_menu) {
    this._idMenu = id_menu;
  }

  tambahKejadwal({required hari})async{
    final prefs = await SharedPreferences.getInstance();
    modelSt = await jadwalClient.tambahJadwal(hari: hari, idUser: prefs.getInt("id"), idMenu: _idMenu);
  }

  tambahKeRiwayat({required idGerakan})async{
    final prefs = await SharedPreferences.getInstance();
    modelSt = await riwayatCLient.addRiwayat(idUser: prefs.getInt("id"), idGerakan: idGerakan);
  }

  final List _listhari = [
    "senin",
    "selasa",
    "rabu",
    "kamis",
    "jumat",
    "sabtu",
    "minggu"
  ];

  @override
  void initState() {
    // TODO: implement initState
    // modelMenu = clientMenu.getMenuLatihan();

    model = client.getIsiMenu(idMenu: this._idMenu).then((value) {
      if (value.status!.isNotEmpty) {
        if (value.status == "oke") {
          awalController(
              "https://drive.google.com/uc?export=view&id=${value.body.isi[0].video}");
        }
      } else {}
      return value;
    });

    // awalController(" https://drive.google.com/uc?export=view&id=${model.body.isi[0].video}");
    super.initState();
  }

  awalController(source) {
    _controller = VideoPlayerController.network(source)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          videoIsInitilized = true;
        });
      });
  }

  gantiVideo(String source) {
    _controller = VideoPlayerController.network(source)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),

        //dropdown
        actions: [
          Row(
            children: [
              DropdownButton(
                icon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.black,
                    size: 26,
                  ),
                ),
                value: _valhari,
                items: _listhari.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  tambahKejadwal(hari: value);
                },
              ),
            ],
          ),
        ],
        title: FutureBuilder(
            future: model,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data!.body.header[0].namaMenuLatihan,
                  style: TextStyle(
                    fontSize: 23,
                  ),
                  textAlign: TextAlign.center,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('error: ' + snapshot.error.toString()),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: false,
        backgroundColor: const Color.fromARGB(255, 202, 202, 202),
        bottom: PreferredSize(
          preferredSize: const Size(200, 4),
          child: Container(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                IsiMEnuLatihanClient().getIsiMenu();
              },
              child: Text('data')),
          FutureBuilder(
              future: model,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 15.89 / 100,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 202, 202, 202),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        right: 10,
                                      ),
                                      child: Text(
                                        "PART   : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 17),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.body.header[0].headerPart,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        right: 10,
                                      ),
                                      child: Text(
                                        "LEVEL : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 17),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.body.header[0].level,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(
                    child: Text('error: ' + snapshot.error.toString()),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          FutureBuilder(
            future: model,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                awalController(snapshot.data!.body.isi[0].video);
                if (videoIsInitilized) {
                  setState(() {
                    
                  });
                  return VideoPlayer(_controller);
                } else {
                  return Center(child: Text("tdak ada video"));
                }
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Icon(Icons.play_arrow_sharp),
                  ),
                );
              } else {
                return Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Icon(Icons.play_arrow_sharp),
                  ),
                );
              }
            },
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 302,
            // height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
                future: model,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.body.isi.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.network(
                            "https://drive.google.com/uc?export=view&id=${snapshot.data!.body.isi[index].gambar}",
                          ),
                          title:
                              Text(snapshot.data!.body.isi[index].namaGerakan),
                          subtitle: Text(snapshot.data!.body.isi[index].note),
                          trailing: Column(
                            children: [
                              Text(
                                  "repetisi : ${snapshot.data!.body.isi[index].repetisi}"),
                              Text(
                                  "set : ${snapshot.data!.body.isi[index].setLatihan}")
                            ],
                          ),
                          onTap: () {
                            tambahKeRiwayat(idGerakan: snapshot.data!.body.isi[index].idGerakan);
                          },
                        );
                      },
                    );
                  } else if(snapshot.hasError){
                    print("error in listtile isi menu latihan coused by :${snapshot.error}");
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        content: Text("ada yang salah"),
                      );
                    },);
                    return Center(child: CircularProgressIndicator(),);
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                }),
          )
        ],
      ),
    );
  }
}

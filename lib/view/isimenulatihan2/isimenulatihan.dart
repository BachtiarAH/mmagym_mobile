import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mmagym_mobile/clien/AlatClient.dart';
import 'package:mmagym_mobile/clien/GerakanClient.dart';
import 'package:mmagym_mobile/models/AlatModel.dart';
import 'package:mmagym_mobile/models/GerakanAlatModel.dart';

class isimenulatihan extends StatefulWidget {
  late int id_gerakan;
  isimenulatihan({super.key, required this.id_gerakan});

  @override
  State<isimenulatihan> createState() =>
      _isimenulatihanState(id_gerakan: id_gerakan);
}

class _isimenulatihanState extends State<isimenulatihan> {
  late Future<GerakanAlatModel> modelGerakan;
  late var clientGerakan = GerakanClient();
  late AlatModel modelAlat;
  late var clientAlat = AlatClient();

  late int id_gerakan;

  _isimenulatihanState({required this.id_gerakan});

  @override
  void initState() {
    // TODO: implement initState
    setModel();
    super.initState();
  }

  setModel() async {
    modelGerakan = clientGerakan.getGerakanByAlat(idAlat: id_gerakan);
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
        title: Text(
          "Dumbbel",
          style: TextStyle(
            fontSize: 22,
          ),
          textAlign: TextAlign.center,
        ),
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
      body: Container(
        alignment: Alignment.center,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Container(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/image 3.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 150,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: FutureBuilder(
                          future: modelGerakan,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (!snapshot.data!.body!.isEmpty) {
                                return ListView.builder(
                                  itemCount: snapshot.data!.body!.length,
                                  itemBuilder: (context, index) {
                                    if (snapshot.hasData) {
                                      return ListTile(
                                        leading: Image.network(
                                          'https://drive.google.com/uc?export=view&id=${snapshot.data!.body![index].gambar}',
                                        ),
                                        title: Text(
                                          snapshot.data!.body![index].nama,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        subtitle: const Text("10 kg"),
                                        trailing: Container(
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          child: Column(
                                            children: const [
                                              Text('10 rep'),
                                              Text('2 set')
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          print('object');
                                        },
                                      );
                                    } else if (snapshot.hasError) {
                                      return Center(
                                        child: Text("error : "),
                                      );
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                );
                              } else {
                                return Center(
                                  child: Text("no data"),
                                );
                              }
                            } else if(snapshot.hasError){
                              showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                  content: Column(
                                    children: [
                                      Text("gerakan pada alat ini belum ditambahkan"),
                                      ElevatedButton(onPressed: () {
                                        Navigator.of(context).pop();
                                      }, child: Text("kembali ke menu utama"))
                                    ],
                                  ),
                                );
                              },
                              );
                              return Text("error");
                            } else{

                              return Center(child: CircularProgressIndicator(),);
                            }
                          })),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mmagym_mobile/clien/MenuLatihanClient.dart';
import 'package:mmagym_mobile/clien/menulatihan_client.dart';
import 'package:mmagym_mobile/models/MenuLatihanModel.dart';
import 'package:mmagym_mobile/models/menulatihan_model.dart';

class Latihan extends StatefulWidget {
  const Latihan({super.key});

  @override
  State<Latihan> createState() => _LatihanState();
}

class _LatihanState extends State<Latihan> {
  late Future<MenuLatihanModel> model;
  MenuLatihanClien client = MenuLatihanClien();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = client.getMenuLatihan();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: model,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          for (var i = 0; i < snapshot.data!.body.length; i++) {}
          return ListView.builder(
            itemCount: snapshot.data!.body.length,
            itemBuilder: (context, index) {
              return ListTile(
                //  isThreeLine: true,
                title: Text(
                  snapshot.data!.body[index].nama,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                // subtitle: Padding(
                //   padding: const EdgeInsets.only(left: 365.0),
                //   child: Text(
                //     snapshot.data!.body[index].
                //     maxLines: 2,
                //     style: const TextStyle(),
                //   ),
                // ),

                leading: Hero(
                  tag:
                      'https://drive.google.com/uc?export=view&id=${snapshot.data!.body[index].gambar}',
                  child: Image.network(
                    'https://drive.google.com/uc?export=view&id=${snapshot.data!.body[index].gambar}',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

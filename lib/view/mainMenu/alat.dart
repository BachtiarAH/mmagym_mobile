import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mmagym_mobile/clien/AlatClient.dart';
import 'package:mmagym_mobile/models/AlatModel.dart';

class AlatView extends StatefulWidget {
  const AlatView({super.key});

  @override
  State<AlatView> createState() => _AlatState();
}

class _AlatState extends State<AlatView> {
  late Future<AlatModel> model;
  AlatClient client = AlatClient();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = client.getAlatAll();
  }

  refres() {
    model = client.getAlatAll();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            model = client.getAlat();
          },
          icon: Icon(Icons.refresh),
        ),
        FutureBuilder(
          future: model,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.body!.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return GridTile(
                    footer: GridTileBar(
                      title: Text(
                        snapshot.data!.body![index].nama,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      // subtitle: Text(_item.description),
                      backgroundColor: Colors.black38,
                    ),
                    child: GestureDetector(
                      // onTap: () => _selectItem(context),
                      child: Hero(
                        key: Key(
                            'https://drive.google.com/uc?export=view&id=${snapshot.data!.body![index].gambar}'),
                        tag: snapshot.data!.body![index].nama,
                        child: Image.network(
                          'https://drive.google.com/uc?export=view&id=${snapshot.data!.body![index].gambar}',
                          fit: BoxFit.cover,
                        ),
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
        ),
      ],
    );
  }
}

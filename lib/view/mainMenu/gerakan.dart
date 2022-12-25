import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mmagym_mobile/clien/GerakanClient.dart';
import 'package:mmagym_mobile/models/GerakanModel.dart';

class GerakanView extends StatefulWidget {
  const GerakanView({super.key});

  @override
  State<GerakanView> createState() => _GerakanViewState();
}

class _GerakanViewState extends State<GerakanView> {
  late Future<GerakanModel> model;
  GerakanClient client = GerakanClient();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = client.getGerakanAll();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: model,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            itemCount: snapshot.data!.body!.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return GridTile(
                footer: GridTileBar(
                  title: Text(snapshot.data!.body![index].gerakan),
                  // subtitle: Text(_gerakan.description),
                  backgroundColor: Colors.black38,
                ),
                child: GestureDetector(
                  child: Image.network(
                    'https://drive.google.com/uc?export=view&id=${snapshot.data!.body![index].gambar}',
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

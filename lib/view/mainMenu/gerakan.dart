import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mmagym_mobile/clien/GerakanClient.dart';
import 'package:mmagym_mobile/models/GerakanModel.dart';

class Gerakan extends StatefulWidget {
  const Gerakan({super.key});

  @override
  State<Gerakan> createState() => _GerakanState();
}

class _GerakanState extends State<Gerakan> {
  late Future<GerakanModel> model;
  GerakanClient client = GerakanClient();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = client.getGerakan();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
                  title: Text(snapshot.data!.body![index].gerakan),
                  // subtitle: Text(_gerakan.description),
                  backgroundColor: Colors.black38,
                ),
                child: GestureDetector(
                  // onTap: () {
                  //   this.insialisasiVideo();
                  //   showDialog<String>(
                  //     context: context,
                  //     builder: (BuildContext context) => AlertDialog(
                  //       title: const Text('AlertDialog Title'),
                  //       content: Center(
                  //           child: AspectRatio(
                  //         aspectRatio: _controller.value.aspectRatio,
                  //         child: Column(
                  //           children: [
                  //             Text('data'),
                  //             Container(
                  //                 height: 100, child: VideoPlayer(_controller)),
                  //             Icon(Icons.play_arrow)
                  //           ],
                  //         ),
                  //       )),
                  //       actions: <Widget>[
                  //         TextButton(
                  //           onPressed: () => Navigator.pop(context, 'Cancel'),
                  //           child: const Text('Cancel'),
                  //         ),
                  //         TextButton(
                  //           onPressed: () => Navigator.pop(context, 'OK'),
                  //           child: const Text('OK'),
                  //         ),
                  //       ],
                  //     ),
                  //   );
                  // },
                  child: Hero(
                    key: Key(
                        'https://drive.google.com/uc?export=view&id=${snapshot.data!.body![index].gambar}'),
                    tag: snapshot.data!.body![index].gerakan,
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
    );
  }
}

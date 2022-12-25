import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mmagym_mobile/clien/MenuLatihanClient.dart';
import 'package:mmagym_mobile/clien/menulatihan_client.dart';
import 'package:mmagym_mobile/models/MenuLatihanModel.dart';
import 'package:mmagym_mobile/models/menulatihan_model.dart';
import 'package:mmagym_mobile/view/menulatihan/menulatihan.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Latihan extends StatefulWidget {
  const Latihan({super.key});

  @override
  State<Latihan> createState() => _LatihanState();
}

class _LatihanState extends State<Latihan> {
  late Future<MenuLatihanModel> model;
  MenuLatihanClien client = MenuLatihanClien();
    double ContMenuLatHeigh = Adaptive.h(39.5);

   double CardMenuLatHeigh() => ContMenuLatHeigh * 40 / 100;

  double CardMenuLatihanWidth = Adaptive.w(95);
  double CardMenulatihanImgHigh() => CardMenuLatHeigh();
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
                          return ListView.builder(
                            itemCount: snapshot.data!.body.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => menulatihan(idMenu: snapshot.data!.body[index].id,)));
                                },
                                child: createCardMenuLatihan(
                                    id: snapshot.data!.body[index].id,
                                    NamaMenu: snapshot.data!.body[index].nama,
                                    level: snapshot.data!.body[index].level,
                                    partBadan:
                                        snapshot.data!.body[index].bodyPart),
                              );
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
      },
    );
  }

  Widget createCardMenuLatihan(
        {required id,
        required String NamaMenu,
        required String level,
        required String partBadan}) {
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
                  SizedBox(height: CardMenuLatHeigh() * 40 / 100),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      partBadan,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(height: 13),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      level,
                      style: const TextStyle(
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
                  child: const FlutterLogo(),
                ),
              ),
            ),
          ],
        ),
      );
    }
}

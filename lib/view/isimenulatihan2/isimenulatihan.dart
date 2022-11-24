import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class isimenulatihan extends StatefulWidget {
  const isimenulatihan({super.key});

  @override
  State<isimenulatihan> createState() => _isimenulatihanState();
}

class _isimenulatihanState extends State<isimenulatihan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
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
                    height: 150,
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
                    height: 60,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.accessibility_new_sharp,size: 40,),
                        ),
                        Text(
                          "Brench Press",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                    // child: Text(
                    //   "Bench Press",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w600,
                    //     fontSize: 20 ),
                    // ),
                  ),
                  Divider(thickness: 1,
                  color: Colors.black,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.accessibility_new_sharp,size: 40,),
                        ),
                        Text(
                          "Brench Press",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1,
                  color: Colors.black,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.accessibility_new_sharp,size: 40,),
                        ),
                        Text(
                          "Brench Press",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1,
                  color: Colors.black,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.accessibility_new_sharp,size: 40,),
                        ),
                        Text(
                          "Brench Press",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1,
                  color: Colors.black,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.accessibility_new_sharp,size: 40,),
                        ),
                        Text(
                          "Brench Press",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1,
                  color: Colors.black,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.accessibility_new_sharp,size: 40,),
                        ),
                        Text(
                          "Brench Press",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1,
                  color: Colors.black,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.accessibility_new_sharp,size: 40,),
                        ),
                        Text(
                          "Brench Press",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1,
                  color: Colors.black,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.accessibility_new_sharp,size: 40,),
                        ),
                        Text(
                          "Brench Press",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1,
                  color: Colors.black,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.accessibility_new_sharp,size: 40,),
                        ),
                        Text(
                          "Brench Press",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1,
                  color: Colors.black,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.accessibility_new_sharp,size: 40,),
                        ),
                        Text(
                          "Brench Press",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

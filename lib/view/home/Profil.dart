import 'package:flutter/material.dart';
import 'package:mmagym_mobile/view/login/login.dart';
import 'package:mmagym_mobile/view/template/Componen.dart';
import 'package:text_area/text_area.dart';
import 'package:web_date_picker/web_date_picker.dart';
// import 'package:responsive';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  // Komponen komponen = new Komponen();
  // ignore: prefer_final_fields
  String _gender = "laki";
  double gap = 14;
  GlobalKey registerKey = GlobalKey();

  var reasonValidation;

  var KontrolerNama;

  var KontrolerEmail;

  DateTime? TanggalLahir;

  var KontrolerAlamat;

  var KontrolerPassword;

  var KontrolerConfirmPassword;

  //fungsi pilih agaman
  void _pilihGender(String value) {
    setState(() {
      _gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Profil",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          actions: [IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: 
            (context) => Login(),));
          }, icon: Icon(Icons.logout))],
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: registerKey,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 19, left: 14, bottom: 14),
                child: const Text(
                  "Profil",
                  style: TextStyle(fontSize: 40),
                ),
              ),

              Padding(padding: EdgeInsets.only(top: gap)),

              //form nama
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 21),
                  child: TextField(
                    controller: KontrolerNama,
                    decoration:
                        Komponens().getInputDecoration(labelText: "Name"),
                  )),

              Padding(padding: EdgeInsets.only(top: gap)),

              //form email
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 21),
                  child: TextField(
                    controller: KontrolerEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        Komponens().getInputDecoration(labelText: "Email"),
                  )),

              Padding(padding: EdgeInsets.only(top: gap)),

              //row gender dan umur
              Container(
                alignment: Alignment.center,
                // width: max,
                height: 56,
                margin: const EdgeInsets.symmetric(horizontal: 21),
                child: Row(
                  children: [
                    //gender
                    Container(
                        // width: 105,

                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color.fromARGB(28, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 245, 245, 245),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        margin: const EdgeInsets.only(left: 17, right: 17),
                        child: DropdownButton(
                            // underline: null,
                            style: TextStyle(decoration: TextDecoration.none),
                            borderRadius: BorderRadius.circular(20),
                            onChanged: (String? value) {
                              _pilihGender(value!);
                            },
                            value: _gender,
                            items: ["laki", "permepuan"].map((String? value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value!,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList())),

                    //tanggal lahir
                    Container(
                        alignment: Alignment.topRight,
                        width: 200,
                        // margin: const EdgeInsets.,
                        child: Center(child: WebDatePicker(
                          onChange: (value) {
                            TanggalLahir = value;
                          },
                        )))
                  ],
                ),
              ),

              //alamat

              Padding(padding: EdgeInsets.only(top: 17)),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 21),
                // height: 155,
                child: TextArea(
                  textEditingController: KontrolerAlamat,
                  borderRadius: 10,
                  borderColor: const Color(0xFFCFD6FF),
                  // textEditingController: myTextController,
                  // suffixIcon: Icons.attach_file_rounded,
                  onSuffixIconPressed: () => {},
                  validation: true,
                  errorText: 'Please type a reason!',
                ),
              ),

              Padding(padding: EdgeInsets.only(top: gap)),

              //form password
              Container(
                  
                  margin: const EdgeInsets.symmetric(horizontal: 21),
                  child: TextField(
                    
                    controller: KontrolerPassword,
                    obscureText: true,
                    decoration:
                        Komponens().getInputDecoration(labelText: "password"),
                  )),

              Padding(padding: EdgeInsets.only(top: gap)),

              //form password
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 21),
                  child: TextField(
                    controller: KontrolerConfirmPassword,
                    obscureText: true,
                    decoration: Komponens()
                        .getInputDecoration(labelText: "Confirm Password"),
                  )),

              Padding(padding: EdgeInsets.only(top: gap)),

              //tombol save
              Container(
                margin: EdgeInsets.symmetric(horizontal: 21),
                decoration: BoxDecoration(),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF434343)),
                  onPressed: () {},
                  child: Text("Save"),
                ),
              )
            ],
          ),
        ));
  }
}

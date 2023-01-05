import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mmagym_mobile/clien/UserClient.dart';
import 'package:mmagym_mobile/models/StatusMessage.dart';
import 'package:mmagym_mobile/models/UserModel.dart';
import 'package:mmagym_mobile/view/login/login.dart';
import 'package:mmagym_mobile/view/template/Componen.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  late StatusMessage model;
  late UserClient client = UserClient();

  late var UserMod = UserModel();

  var reasonValidation;

  var KontrolerNama = TextEditingController();

  var KontrolerEmail = TextEditingController();

  DateTime? TanggalLahir;

  var KontrolerAlamat = TextEditingController();

  var KontrolerPassword = TextEditingController();

  var KontrolerConfirmPassword = TextEditingController();

  ediData(
      {required nama,
      required email,
      required password,
      required alamat}) async {
    model = await client.EditDataUser(
        id: UserMod.id,
        nama: nama,
        email: email,
        password: password,
        alamat: alamat);
  }

  setModelWithController() {
    UserMod.nama = KontrolerNama.text;
    UserMod.email = KontrolerEmail.text;
    UserMod.alamat = KontrolerAlamat.text;
    UserMod.password = KontrolerPassword.text;
  }

  saveProfil() async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getInt("id"));
    model = await client.EditDataUser(
            id: prefs.getInt("id")!,
            nama: KontrolerNama.text,
            email: KontrolerEmail.text,
            password: KontrolerPassword.text,
            alamat: KontrolerAlamat.text)
        .then(
      (value) {
        print(value.message);
        if (value.status == "succes") {
          setPref(
              nama: KontrolerNama.text,
              email: KontrolerEmail.text,
              password: KontrolerPassword.text,
              alamat: KontrolerAlamat.text);
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                
                content: Text("data berhasil disimpan"),
              );
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(value.message.toString()),
              );
            },
          );
        }

        return value;
      },
    );

    ;
  }

  setModelWithPRef({required UserModel Usermodel}) async {
    final prefs = await SharedPreferences.getInstance();
    print("pref : " + prefs.getString("nama").toString());
    prefs.reload();
    Usermodel.setId = prefs.getInt("id");
    Usermodel.nama = prefs.getString("nama").toString();
    Usermodel.email = prefs.getString("email").toString();
    Usermodel.alamat = prefs.getString("alamat").toString();
    Usermodel.password = prefs.getString("password").toString();
  }

  setKontrollerText(UserModel userModel) {
    print("seting controller");
    KontrolerNama.text = userModel.nama;
    KontrolerEmail.text = userModel.email;
    KontrolerPassword.text = userModel.password;
    KontrolerAlamat.text = userModel.alamat;
    KontrolerConfirmPassword.text = userModel.password;
    print("controller hasbeen set");
  }

  setPref(
      {required nama,
      required email,
      required password,
      required alamat}) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString("nama", nama);
    await pref.setString("email", email);
    await pref.setString("password", password);
    await pref.setString("alamat", alamat);
  }

  //fungsi pilih agaman
  void _pilihGender(String value) {
    setState(() {
      _gender = value;
    });
  }

  mulai() async {
    await setModelWithPRef(Usermodel: this.UserMod);
    await setKontrollerText(this.UserMod);
  }

  @override
  void initState() {
    // TODO: implement initState
    // setModelWithPRef(Usermodel: this.UserMod);
    setState(() {
      mulai();
    });
    print(UserMod.nama);
    print(KontrolerNama.text);
    super.initState();
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
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Login(),
                  ));
                },
                icon: Icon(Icons.logout))
          ],
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
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF434343)),
                  onPressed: () {
                    saveProfil();
                  },
                  child: Text("Save"),
                ),
              )
            ],
          ),
        ));
  }
}

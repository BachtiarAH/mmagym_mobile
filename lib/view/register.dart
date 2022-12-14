import 'package:flutter/material.dart';
import 'package:mmagym_mobile/clien/RegisterClinet.dart';
import 'package:mmagym_mobile/view/login/login.dart';
import 'package:mmagym_mobile/view/register/otpRegister.dart';
import 'package:mmagym_mobile/view/template/Componen.dart';
import 'package:text_area/text_area.dart';
import 'package:web_date_picker/web_date_picker.dart';

import '../models/registeModel.dart';
// import 'package:responsive';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Komponen komponen = new Komponen();
  // ignore: prefer_final_fields
  var client = RegisterClient();
  var model = RegisterModel(status: "fail", message: "belum melakukan register");
  String _gender = "laki";
  double gap = 14;
  GlobalKey registerKey = GlobalKey();
  String pesanRegister = "loading...";

  var reasonValidation;

  TextEditingController KontrolerNama = TextEditingController();

  late TextEditingController KontrolerEmail = TextEditingController();

  DateTime? TanggalLahir;

  late TextEditingController KontrolerAlamat = TextEditingController();

  late TextEditingController KontrolerPassword = TextEditingController();

  late TextEditingController KontrolerConfirmPassword = TextEditingController();

  //fungsi pilih agaman
  void _pilihGender(String value) {
    setState(() {
      _gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: registerKey,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 19, left: 14, bottom: 14),
                child: const Text(
                  "Register",
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
                                child: Text(value!),
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
                child: ElevatedButton(
                    onPressed: () {
                      String nama = KontrolerNama.text;
                      String email = KontrolerEmail.text;
                      String password = KontrolerPassword.text;
                      String confirmPassword = KontrolerConfirmPassword.text;
                      String alamat = KontrolerAlamat.text;

                      if (password == confirmPassword) {
                        showDialog(
                          
                          context: context, builder: (context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.all(20),
                            title: Text("Registering"),
                            content: Container(
                              height: 0.3 * MediaQuery.of(context).size.width,
                              child: Center(child: Text(pesanRegister))),
                          );
                        },);
                        // setPesan();
                        sigUp(nama: nama, email: email, password: password, alamat: alamat, context: context);
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Warnig!'),
                                content: Text('Confirm password tidak sama dengan password'),
                              );
                            });
                      }
                    },
                    child: Text("Save")),
              )
            ],
          ),
        ));
  }

  sigUp({required nama, required email , required password, required alamat, required context}) async{
    this.model = await RegisterClient().postRegister(
                            nama: nama,
                            email: email,
                            password: password,
                            alamat: alamat);
    if (!model.status.isEmpty) {
      print("status : not empty {${model.status}}");
      setState(() {
        this.pesanRegister = model.status;
      });
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => OtpRegister(email: email),));
      setState(() {
        this.pesanRegister = "loading...";
      });
    } else {
      print("status : empty");
    }
  }

  setPesan(){
    setState(() {
      this.pesanRegister = "pesan diganti";
    });
  }
}

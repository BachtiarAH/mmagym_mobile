import 'package:flutter/material.dart';
import 'package:mmagym_mobile/view/template/Componen.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Komponen komponen = new Komponen();
  // ignore: prefer_final_fields
  String _gender = "laki";
  double gap = 14;

  //fungsi pilih agaman
  void _pilihGender(String value) {
    setState(() {
      _gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
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
                decoration: Komponens().getInputDecoration(labelText: "Name"),
              )),

          Padding(padding: EdgeInsets.only(top: gap)),

          //form email
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 21),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: Komponens().getInputDecoration(labelText: "Email"),
              )),

          Padding(padding: EdgeInsets.only(top: gap)),

          //row gender dan umur
          Container(
            // width: max,
            height: 56,
            margin: const EdgeInsets.symmetric(horizontal: 21),
            child: Row(
              children: [
                Container(
                    // width: 105,
                    color: Colors.grey,
                    margin: const EdgeInsets.only(left: 17, right: 17),
                    child: DropdownButton(
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
                  width: 200,
                  // margin: const EdgeInsets.,
                  child: TextField(
                    decoration: Komponens()
                        .getInputDecoration(labelText: "tanggal lahir"),
                  ),
                )
              ],
            ),
          ),

          //alamat

          Padding(padding: EdgeInsets.only(top: 17)),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 21),
            height: 155,
            child: TextField(
              decoration: Komponens().getInputDecoration(labelText: "Almat"),
            ),
          ),

          Padding(padding: EdgeInsets.only(top: gap)),

          //form password
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 21),
              child: TextField(
                obscureText: true,
                decoration: Komponens().getInputDecoration(labelText: "password"),
              )),

          Padding(padding: EdgeInsets.only(top: gap)),

          //form password
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 21),
              child: TextField(
                obscureText: true,
                decoration: Komponens().getInputDecoration(labelText: "Confirm Password"),
              )),
        ],
      ),
    ));
  }
}

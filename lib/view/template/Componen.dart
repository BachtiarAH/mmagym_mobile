import 'package:flutter/material.dart';

class Komponens extends StatelessWidget {
  // const Komponens({super.key});

  TextEditingController kontroller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Container();
  }

  getTextForm({TextEditingController? controler,required String labelText}) {
    return TextFormField(
      controller: controler,

      decoration:  InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 245, 245, 245),
        label: Text(
          labelText,
          style: TextStyle(color: Colors.grey),
        ),
        hintText: "",
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0)),
            borderRadius: BorderRadius.all(Radius.circular(20)))),
    );

  }

  getInputDecoration({required String labelText,String? hintText}){
    return InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 245, 245, 245),
        label: Text(
          labelText,
          style: TextStyle(color: Colors.grey),
        ),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(28, 0, 0, 0),style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(20))));
  }
}

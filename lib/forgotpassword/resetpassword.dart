import 'package:flutter/material.dart';
import 'package:mmagym_mobile/view/home/home.dart';
import 'package:mmagym_mobile/forgotpassword/forgotpassword.dart';
import 'package:mmagym_mobile/view/login/login.dart';
import 'package:mmagym_mobile/view/register.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:material_color_generator/material_color_generator.dart';

class ResetPassword extends StatelessWidget {
   ResetPassword({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[ Container(
          padding: EdgeInsets.all(25),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(children: [
                SizedBox(
                  height: 35,
                ),
                Image.asset('img/logo.png'),
                SizedBox(
                  height: 32,
                ),
                Text(
                  'Reset Your Password',
                  style: TextStyle(fontSize: 40),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Enter Your Password',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field tidak boleh kosong";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 245, 245, 245),
                      filled: true,

                      
                      label: Text("New Password"),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide.none)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 245, 245, 245),
                      filled: true,
                      label: Text("Confirm New Password"),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field tidak boleh kosong";
                    }
                    return null;
                  },
                ),
              
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                  if (_formKey.currentState!.validate()){
                      Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Login()));
                  }
                  
                  },
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(
                      primary: generateMaterialColor(
                          color: Color.fromARGB(255, 67, 67, 67)),
                      // shape: StadiumBorder(),
                      minimumSize: Size(MediaQuery.of(context).size.width, 50)),
                ),
                
              ]),
            ),
          ),
        ),]
      ),
    );
  }
}

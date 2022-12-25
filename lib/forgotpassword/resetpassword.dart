import 'package:flutter/material.dart';
import 'package:mmagym_mobile/clien/ResetPasswordClien.dart';
import 'package:mmagym_mobile/models/ResetPasswordModel.dart';
import 'package:mmagym_mobile/view/home/home.dart';
import 'package:mmagym_mobile/forgotpassword/forgotpassword.dart';
import 'package:mmagym_mobile/view/login/login.dart';
import 'package:mmagym_mobile/view/register.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:material_color_generator/material_color_generator.dart';

class ResetPassword extends StatefulWidget {
  late String email;
  late String otp;
   ResetPassword({super.key, required this.email, required this.otp});

  @override
  State<ResetPassword> createState() => _ResetPasswordState(email: this.email, otp: this.otp);
}

class _ResetPasswordState extends State<ResetPassword> {
  late ResetPasswordModel model ;
  var client = ResetPasswordClien();

  final _formKey = GlobalKey<FormState>();

  TextEditingController conNewPass = TextEditingController();
  TextEditingController conVerPass = TextEditingController();

  late String email;
  late String otp;

  Widget contenButton = Text("submit");

  _ResetPasswordState({required email, required otp}){
    this.email = email;
    this.otp = otp;
  }

  submitNewPasswrd({required pass }) async{
    setState(() {
      contenButton = CircularProgressIndicator();
    });
    model = await client.submitPassword(email: email, otp: otp, newPassword: pass);
    setState(() {
      contenButton = Text("submit");
    });

    if (!model.status.isEmpty) {
      if (model.status == "success") {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login(),));
      } else {
        showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text("gagal"),
          content: Text(model.message),
        );
      },);
      }
    } else {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text("gagal"),
          content: Text("ada sesuatu yang salah"),
        );
      },);
    }
  }

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
                  controller: conNewPass,
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
                  controller: conVerPass,
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
                      submitNewPasswrd(pass: conNewPass.text);
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

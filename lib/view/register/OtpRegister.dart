import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:mmagym_mobile/clien/RegisterClinet.dart';
import 'package:mmagym_mobile/forgotpassword/resetpassword.dart';
import 'package:mmagym_mobile/models/OtpModel.dart';
import 'package:mmagym_mobile/view/login/login.dart';

class OtpRegister extends StatefulWidget {
  // late String email;
  var email;
  OtpRegister({super.key,required this.email});

  @override
  State<OtpRegister> createState() => _OtpRegisterState(email);
}

class _OtpRegisterState extends State<OtpRegister> {
  final _formKey = GlobalKey<FormState>();
  var model = OtpModel(status: "fail", message: "belum dikirim");
  var client = RegisterClient();
  late String _email;
  Widget contenPopUp = CircularProgressIndicator();

  String verificationCode = "";

  _OtpRegisterState(email){
    this._email = email;
  }

  sendOtp({required email, required otp}) async {
    model = await client.postOtp(email: email, otp: otp);
    
    if (!model.status.isEmpty) {
      if (model.status == "success") {
          setState(() {
            this.contenPopUp = Text(model.message);
          });
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login(),));
      } else {
        setState(() {
            this.contenPopUp = Text(model.message);
          });
      }
    } else {
      setState(() {
            this.contenPopUp = Text(model.message);
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Yay! A SnackBar!'),
    );
    return Scaffold(
        body: ListView(children: [
      Container(
          padding: EdgeInsets.all(25),
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
                  'Check Your Email',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Submit OTP",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                OtpTextField(
                  clearText: true,
                  margin: EdgeInsets.only(right: 30),
                  numberOfFields: 4,
                  focusedBorderColor: Colors.blue,
                  // borderColor:Color.fromARGB(255, 67, 67, 67) ,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  // onCodeChanged: (String code) {
                  //   //handle validation or checks here
                  // },
                  //runs when every textfield is filled
                  onSubmit: (verificationCode) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Verification Code"),
                            content: contenPopUp,
                          );
                        });

                    sendOtp(email: this._email, otp: verificationCode);
                  }, // end onSubmit
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (verificationCode != null || verificationCode.isEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      
                    }
                  },
                  child: Text("Next"),
                  style: ElevatedButton.styleFrom(
                      primary: generateMaterialColor(
                          color: Color.fromARGB(255, 67, 67, 67)),
                      minimumSize: Size(MediaQuery.of(context).size.width, 50)),
                ),
              ])))
    ]));
  }
}

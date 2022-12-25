import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:mmagym_mobile/clien/ResetPasswordClien.dart';
import 'package:mmagym_mobile/forgotpassword/resetpassword.dart';
import 'package:mmagym_mobile/models/ResetPasswordModel.dart';

class SubmitOTP extends StatefulWidget {
  late String email;
  SubmitOTP({super.key, required this.email});

  @override
  State<SubmitOTP> createState() => _SubmitOTPState(email: this.email);
}

class _SubmitOTPState extends State<SubmitOTP> {
  late ResetPasswordModel model;
  late ResetPasswordClien clien = ResetPasswordClien();

  final _formKey = GlobalKey<FormState>();

  String verificationCode = "";

  late String email;

  Widget contenPopup = CircularProgressIndicator();
  Widget contenButton = Text("Next");
  _SubmitOTPState({required email}) {
    this.email = email;
  }

  cekOtp({required otp}) async {
    model = await clien.cekOtp(email: this.email, otp: otp);

    if (!model.status.isEmpty) {
      setState(() {
        this.contenButton = Text("Next");
      });
      if (model.status == "success") {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("success"),
            );
          },
        );

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ResetPassword(email: this.email, otp: otp),
        ));
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("fail"),
              content: Text(model.message),
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("fail"),
            content: Text("somethisng wrong"),
          );
        },
      );
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
                    setState(() {
                      this.contenButton = CircularProgressIndicator();
                    });
                    cekOtp(otp: verificationCode);
                  }, // end onSubmit
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (verificationCode != null || verificationCode.isEmpty) {
                      setState(() {
                        this.contenButton = CircularProgressIndicator();
                      });
                      cekOtp(otp: verificationCode);
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("inputan kosong"),
                            content: Text("tolong isikan otp yang dikirim ke email anda"),
                          );
                        },
                      );
                    }
                  },
                  child: contenButton,
                  style: ElevatedButton.styleFrom(
                      primary: generateMaterialColor(
                          color: Color.fromARGB(255, 67, 67, 67)),
                      minimumSize: Size(MediaQuery.of(context).size.width, 50)),
                ),
              ])))
    ]));
  }
}

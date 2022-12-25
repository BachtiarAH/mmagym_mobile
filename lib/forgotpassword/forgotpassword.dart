import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:mmagym_mobile/clien/ResetPasswordClien.dart';
import 'package:mmagym_mobile/forgotpassword/resetpassword.dart';
import 'package:mmagym_mobile/forgotpassword/submitOTP.dart';
import 'package:mmagym_mobile/models/ResetPasswordModel.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ForgotPass extends StatefulWidget {
  ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final _formKey = GlobalKey<FormState>();
  late ResetPasswordModel model;
  var clien = ResetPasswordClien();
  Widget ContentPopup = CircularProgressIndicator();
  TextEditingController emailController = TextEditingController();

  //sendOTP
  sendOTP({required Email})async{
    model = await clien.resetPassword(email: Email);
    print(model.message);
    if(!model.status.isEmpty){
      if(model.status=="success"){
        // return value;
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SubmitOTP(email: Email,),));
      }else{
        // return value;
        print("message : "+model.message);
        setState(() {
          this.ContentPopup = Text(model.message);
        });
      }

      
    }
  }


  @override
  Widget build(BuildContext context) {
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
                      'Forget Your Password?',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Enter Your Account Email",
                        style: TextStyle(fontSize: 20),),
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    TextFormField(
                      controller:  emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field tidak boleh kosong";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 245, 245, 245),
                          filled: true,
                          label: Text("Email"),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          focusedBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.blue)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide.none)),
                    ),

                 SizedBox(height: 40),
                     ElevatedButton(
                  onPressed: () {
                  if (_formKey.currentState!.validate()){
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: Text('loading'),content: ContentPopup,
                        );
                      },);

                      sendOTP(Email: emailController.text);
                  }
                  
                  },
                  child: Text("Next"),
                  style: ElevatedButton.styleFrom(
                      primary: generateMaterialColor(
                          color: Color.fromARGB(255, 67, 67, 67)),
                      
                      minimumSize: Size(MediaQuery.of(context).size.width, 50)),
                ),
                
                  SizedBox(height: 10),

                 ElevatedButton(
                  onPressed: () {
                      Navigator.of(context).pop();
                  
                  
                  },
                  child: Text("Cancel"),
                  style: ElevatedButton.styleFrom(
                      primary: generateMaterialColor(
                          color: Color.fromARGB(255, 67, 67, 67)),
                      
                      minimumSize: Size(MediaQuery.of(context).size.width, 50)),
                ),
                  ])))
    ]));
  }
}

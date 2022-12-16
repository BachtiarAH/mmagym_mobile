import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:mmagym_mobile/forgotpassword/submitOTP.dart';

class ForgotPass extends StatelessWidget {
  ForgotPass({super.key});

  final _formKey = GlobalKey<FormState>();

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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SubmitOTP()));
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

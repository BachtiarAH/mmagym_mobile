import 'package:flutter/material.dart';
import 'package:mmagym_mobile/clien/loginCLient.dart';
import 'package:mmagym_mobile/models/StatusMessage.dart';
import 'package:mmagym_mobile/view/home/home.dart';
import 'package:mmagym_mobile/view/register.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:material_color_generator/material_color_generator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
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
                  'Login',
                  style: TextStyle(fontSize: 40),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
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
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 245, 245, 245),
                      filled: true,
                      label: Text("Password"),
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
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Future<StatusMessage> stms = LoginClient().login(
                          email: emailController.text,
                          password: passwordController.text);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return FutureBuilder(
                              future: stms,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return AlertDialog(
                                  title: Text('tes'),
                                  content: Text(
                                      snapshot.data!.message),
                                );
                                } else {
                                  return AlertDialog(
                                  title: Text('tes'),
                                  content: Text(
                                      "no data"),
                                );
                                }
                              },
                            );
                          });
                      // Navigator.of(context)
                      //   .push(MaterialPageRoute(builder: (context) => Home()));
                    }
                  },
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(
                      primary: generateMaterialColor(
                          color: Color.fromARGB(255, 67, 67, 67)),
                      shape: StadiumBorder(),
                      minimumSize: Size(MediaQuery.of(context).size.width, 50)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do not have account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      },
                      child: Text("Register",
                          style: TextStyle(
                              color: Color.fromARGB(255, 160, 162, 0))),
                    )
                  ],
                )
              ]),
            ),
          ),
        ),
      ]),
    );
  }
}

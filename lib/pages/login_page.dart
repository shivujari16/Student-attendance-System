import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
//import 'package:flutter1/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'faculty.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = "";
  String _password = "";
  final auth = FirebaseAuth.instance;

  bool click = false;
  final formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      setState(() {
        click = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRouts.homeRoute);

      setState(() {
        click = false;
      });
    }
  }

  static Color pinkOrange = Color(0xfff7bb97);
  static Color creamColor = Color(0xfff5f5f5);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.vertical(top: Radius.zero, bottom: Radius.circular(30)),
              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                Colors.pink,
                Colors.orange
              ])),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Icon(CupertinoIcons.profile_circled, size: 64.0),
                  SizedBox(
                    height: 20,
                    //child: Text("hello"),
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                      child: Column(children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            ),
                            errorStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white38,
                            prefixIcon: Icon(CupertinoIcons.person),
                            hintText: "Enter Username",
                            //labelText: "Username",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username can not be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _email = value.trim();
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          height: 15,
                          //child: Text("hello"),
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            ),
                            errorStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white38,
                            prefixIcon: Icon(Icons.vpn_key),
                            hintText: "Enter Password",
                            //labelText: "Password"
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "password can not be empty";
                            }

                            if (value.length < 6) {
                              return "password length should atleast 6";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _password = value.trim();
                            setState(() {});
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          //userdefined button
                          onTap: () async {
                            try {
                              await auth.signInWithEmailAndPassword(email: _email, password: _password);
                              setState(() {
                                click = true;
                              });
                              if (_email.startsWith('host')) {
                                Timer(Duration(seconds: 2), () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Faculty(email: _email))));
                              } else {
                                Navigator.of(context).pushReplacementNamed(MyRouts.subjectRoute);
                              }
                            } on FirebaseAuthException catch (error) {
                              Fluttertoast.showToast(msg: error.message.toString(), gravity: ToastGravity.TOP, timeInSecForIosWeb: 3);
                            }
                          },
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 45,
                            width: click ? 50 : 250,
                            alignment: Alignment.center,
                            child: click ? Icon(Icons.done, color: Colors.white) : const Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(click ? 50 : 150),
                            ),
                          ),
                        ),
                        "Forgot password".text.color(Colors.blueAccent).lg.make().px64().py12(),
                        /*Expanded(
                          child: VxArc(
                              height: 30.0,
                              arcType: VxArcType.CONVEY,
                              edge: VxEdge.TOP,
                              child: Container(
                                color: Colors.white,
                                width: context.screenWidth,
                              )),
                        )*/
                      ]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/attendance.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/utils/routes.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:  FirebaseOptions(
      apiKey: "AIzaSyDUZEMOAETsr9bZAdx-w3OgV4gacehtdVU",
      appId: "1:216068668125:android:f6e83391049c37d0c1b934",
      messagingSenderId: "216068668125",
      projectId: "student-att-fc445"
      
    )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => LoginPage(),
        MyRouts.homeRoute: (context) => HomePage(),
        MyRouts.loginRoute: (context) => LoginPage(),
        MyRouts.subjectRoute: (context) => Subject()
      },
    );
  }
}

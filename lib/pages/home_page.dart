import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_2/utils/routes.dart';


class HomePage extends StatelessWidget {

  static Color creamColor = Color(0xfff5f5f5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Explore",
        style: TextStyle(
          fontFamily: GoogleFonts.lato().fontFamily,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontSize: 24,
          color: Colors.black,
        ),
        textAlign: TextAlign.left,
        )
      ),
      body: SafeArea(
        child: Container(
          //padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                color: creamColor,
                child: ListTile(
                  leading: Container(
                    child: Icon(Icons.person_outline,size:50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.pinkAccent,
                          Colors.orange
                        ]
                     )
                    )
                  ),
                  title: Text("XXXX XXXXXX XXXX",
                    textScaleFactor: 1.5,
                    style: TextStyle(fontFamily: GoogleFonts.lato().fontFamily),
                  ),
                  subtitle: Text("XXXXXXXXXXX"),
                ).py16().px16(),
              ).py16(),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: creamColor,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      tileColor: creamColor,
                      leading: Image.asset("assets/images/pulse.png",height: 100,width: 100),
                      onTap: (){
                        Navigator.pushNamed(context, MyRouts.subjectRoute);
                      },
                      title: Text(
                        "Attendance Tracker",
                        textScaleFactor: 1.4,
                        style: TextStyle(fontFamily: GoogleFonts.lato().fontFamily),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ).px16(),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: creamColor,
                child: Column(
                  children: [
                    ListTile(
                      leading: Image.asset("assets/images/calendar.png", height: 100, width: 100),
                      title: Text(
                        "Calendar",
                        textScaleFactor: 1.5,
                        style: TextStyle(fontFamily: GoogleFonts.lato().fontFamily,fontWeight: FontWeight.bold),
                      )
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                              //userdefined button
                              onTap: () => {},
                              child: Container(
                                height: 45,
                                width: 250,
                                alignment: Alignment.center,
                                child: const Text("Holidays", 
                                  style: TextStyle(color: Colors.white, 
                                    fontWeight: FontWeight.bold, 
                                    fontSize: 20
                                  )
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(150),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.pinkAccent,
                                      Colors.orange
                                    ]
                                  )
                                ),
                              ),
                            )
                  ]
              ).px16().py16(),
            )
              


            ]
          )
        ).py32().px16()
      ),
      endDrawer:  MyDrawer(),

    );
  }
}


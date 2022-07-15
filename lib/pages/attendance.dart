import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Subject extends StatefulWidget {

  static Color creamColor = Color(0xfff5f5f5);

  @override
  State<Subject> createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  bool click=false;

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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: click? Colors.pinkAccent:Subject.creamColor,
                child: Column(
                  children: [
                    ListTile(
                      //leading: Image.asset("assets/images/white.png"),
                      onTap: (){
                        bool click=true;
                        setState(() {
                        });
                      },
                      
                      title: Text(
                        "Subject1",
                        textScaleFactor: 1.5,
                        style: TextStyle(fontFamily: GoogleFonts.lato().fontFamily,fontWeight: FontWeight.bold,color: click?Colors.white:Colors.black),
                      ),
                      subtitle: Text("42/50 classes attended", style: TextStyle(fontFamily: GoogleFonts.lato().fontFamily, color: click ? Colors.white : Colors.black)),
                      trailing: Text("84%", style: TextStyle(fontFamily: GoogleFonts.lato().fontFamily, color: click ? Colors.white : Colors.black)),
                    )
                  ]
                  
      )
      ),
      Card(  
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: click? Colors.pinkAccent:Subject.creamColor,
                child: Column(
                  children: [
                    ListTile(
                      //leading: Image.asset("assets/images/white.png"),
                      onTap: (){
                        click=true;
                        setState(() {
                        });
                      },
                      
                      title: Text(
                        "Subject2",
                        textScaleFactor: 1.5,
                        style: TextStyle(fontFamily: GoogleFonts.lato().fontFamily,fontWeight: FontWeight.bold,color: click?Colors.white:Colors.black),
                      ),
                      subtitle: Text("36/50 classes attended", style: TextStyle(fontFamily: GoogleFonts.lato().fontFamily, color: click ? Colors.white : Colors.black)),
                      trailing: Text("72%", style: TextStyle(fontFamily: GoogleFonts.lato().fontFamily, color: click ? Colors.white : Colors.black)),
                    )
                  ]
      )
      )
            ],
            ),
          ),
          )
    );
  }
}
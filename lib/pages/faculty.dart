// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'student_Details.dart';

class Faculty extends StatefulWidget {
  String email;
  Faculty({required this.email});

  @override
  _FacultyState createState() => _FacultyState();
}

class _FacultyState extends State<Faculty> {
  var name;
  final db = FirebaseFirestore.instance;
  static Color creamColor = Color(0xfff5f5f5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      title: Text("Add Class Name"),
                      content: Form(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Class",
                          ),
                          onChanged: (value) {
                            name = value.trim();
                          },
                        ),
                      ),
                      actions: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            db.collection("${widget.email}").doc("${name}").collection("${name}").doc("${name}").set({});
                            db.collection("${widget.email}").doc("${name}").set({
                              'class': name
                            });
                            Navigator.pop(context);
                          },
                          child: Text("Add"),
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
                        )
                      ]);
                });
          },
          child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [
                    Colors.orange,
                    Colors.pink
                  ])),
              child: Icon(Icons.add))),
      appBar: AppBar(
          title: Text("Classes"),
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
            Colors.pink,
            Colors.orange
          ])))),
      // actions: <Widget>[
      //   IconButton(
      //       icon: Icon(Icons.add),
      //       onPressed: () async {
      //         QuerySnapshot dq = await db.collection("${widget.email}").get();
      //         for (int i = 0; i < dq.docs.length; i++) {
      //           var list = dq.docs[i];
      //           print(list);
      //         }
      //       })
      // ],
      //body: Container,
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection("${widget.email}").snapshots(),
        //stream: projects.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //final result = FirebaseFirestore.instance.collection("${widget.email}").get();
          //final List<DocumentSnapshot> document = result.doc;
          //var docs=snapshot.data;
          // try {
          //   db.collection("${widget.email}").get().then((querySnapshot) {
          //     querySnapshot.docs.forEach((dc) {
          //       print(dc.id);
          //     });
          //   });
          // } on FirebaseException catch (error) {
          //   print("hello");
          // }
          // ;

          //print(snapshot.data!.docs);
          //print(snapshot.data!.docs.length);
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data!.docs[index];

              //DocumentSnapshot ds =await docref.get();
              return Container(
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: creamColor,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Icon(Icons.group, size: 30),
                          tileColor: creamColor,
                          // selected: index == selected,
                          title: Text(
                            ds['class'],
                            textScaleFactor: 1.4,
                            style: TextStyle(fontFamily: GoogleFonts.lato().fontFamily),
                          ),
                          onTap: () {
                            var name = ds['class'];
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => StudentDetails(emails: widget.email, sub: name)));
                            //print(name);
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// ignore_for_file: file_names
// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'faculty.dart';

class StudentDetails extends StatefulWidget {
  String emails;
  var sub;
  StudentDetails({required this.emails, this.sub});

  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  var Sname;
  final db = FirebaseFirestore.instance;
  static Color creamColor = Color(0xfff5f5f5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Faculty(email: widget.emails)));
          },
        ),
        title: Text("Participants"),
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
          Colors.pink,
          Colors.orange
        ]))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        title: Text("Add Student"),
                        content: Form(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Student",
                            ),
                            onChanged: (value) {
                              Sname = value.trim();
                            },
                          ),
                        ),
                        actions: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              db.collection("${widget.emails}").doc("${widget.sub}").collection("${widget.sub}").doc(Sname).set({
                                "id": Sname,
                                "present": 0,
                                "total": 0
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
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection("${widget.emails}").doc("${widget.sub}").collection("${widget.sub}").snapshots(),
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
              itemCount: snapshot.data!.docs.length - 1,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data!.docs[index];

                //DocumentSnapshot ds =await docref.get();
                bool click = false;
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
                            //leading: Icon(Icons.group, size: 30),
                            tileColor: creamColor,
                            // selected: index == selected,
                            title: Text(
                              ds['id'],
                              textScaleFactor: 1.0,
                              style: TextStyle(fontFamily: GoogleFonts.lato().fontFamily),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        click = true;
                                      });
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            var p = ds['present'];
                                            var t = ds['total'];
                                            var ps = ((p / t) * 100).toStringAsFixed(2);
                                            return AlertDialog(
                                                title: Text("Attendance Details"),
                                                content: SingleChildScrollView(
                                                    child: ListBody(
                                                  children: <Widget>[
                                                    Text('Total present: $p'),
                                                    Text('Total class taken: $t'),
                                                    Text('Percentage: $ps'),
                                                  ],
                                                )),
                                                actions: <Widget>[
                                                  Center(
                                                    child: RaisedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("OK"),
                                                    ),
                                                  )
                                                ]);
                                          });
                                    },
                                    icon: Icon(Icons.info_rounded, color: click ? Colors.red : Colors.green[800], size: 27)),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        click = true;
                                      });
                                      db.collection("${widget.emails}").doc("${widget.sub}").collection("${widget.sub}").doc(ds['id']).update({
                                        "total": ds['total'] + 1
                                      });
                                    },
                                    icon: Icon(Icons.cancel_rounded, color: click ? Colors.red : Colors.green[800], size: 27)),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        click = true;
                                      });

                                      db.collection("${widget.emails}").doc("${widget.sub}").collection("${widget.sub}").doc(ds['id']).update({
                                        "present": ds['present'] + 1,
                                        "total": ds['total'] + 1
                                      });
                                      //print(ds['present']);
                                    },
                                    icon: Icon(Icons.check_circle_rounded, color: click ? Colors.red : Colors.green[800], size: 27)),
                                //RawMaterialButton(onPressed: () {}, child: Icon(Icons.cancel_rounded,color: Colors.white), fillColor: Colors.green[800], shape: CircleBorder()),
                                //RawMaterialButton(onPressed: () {}, child: Icon(Icons.done, color: Colors.white), fillColor: Colors.green[800], shape: CircleBorder()),
                              ],
                            ),
                            /*onTap: () {
                            var name = ds['class'];
                            Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDetails(emails: widget.email,sub: name)));
                            //print(name);
                          },*/
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}

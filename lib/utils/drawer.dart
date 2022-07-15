import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  /*String imageurl = "data:image/jpeg;base64,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";*/
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.pink,
                    Colors.orange
                  ]
                )
              ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            /*DrawerHeader(padding: EdgeInsets.zero, child: UserAccountsDrawerHeader(margin: EdgeInsets.zero, accountName: Text("Shivam Jariwala"), accountEmail: Text("shivamjariwala2001@gmail.com"), currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(imageurl)))),*/
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white),
              title: Text(
                "Profile",
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.description_outlined, color: Colors.white),
              title: Text(
                "Assignments",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.news, color: Colors.white),
              title: Text(
                "News & Notices",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dark_mode, color: Colors.white),
              title: Text(
                "Dark mode",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text(
                "setting",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
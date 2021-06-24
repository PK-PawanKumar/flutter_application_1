// import 'dart:io';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/helperpages/routes.dart';

import 'homepage.dart';

class MyDrawer extends StatelessWidget {
  final String Name;
  final String Email;

  // ignore: non_constant_identifier_names
  const MyDrawer({Key? key, required this.Name, required this.Email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://www.clipartkey.com/mpngs/m/197-1971414_avatars-clipart-generic-user-user-profile-icon.png";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text(Name),
                accountEmail: Text(Email),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: TextButton(
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Home",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  // ignore: avoid_print
                  Navigator.pushNamed(context, MyRoutes.homeRoute);
                },
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: TextButton(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Profile",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Homepage(
                        UserName: Name,
                        Emailid: Email,
                      ),
                    ),
                  );
                },
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: Colors.white,
              ),
              title: TextButton(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Settings",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.SettingRoute);
                },
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: TextButton(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Contact",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.ContactRoute);
                },
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.lock,
                color: Colors.white,
              ),
              title: TextButton(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Logout",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.loginRoute);
                },
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              title: TextButton(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Quit",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  Future.delayed(const Duration(milliseconds: 1000), () {
                    exit(0);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

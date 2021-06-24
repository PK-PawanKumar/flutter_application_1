import 'package:flutter/material.dart';
import 'package:flutter_application/DrawerHelper/conact.dart';
import 'package:flutter_application/DrawerHelper/profile.dart';
import 'package:flutter_application/DrawerHelper/quit.dart';
import 'package:flutter_application/DrawerHelper/setting.dart';
import 'package:flutter_application/pages/MyTask.dart';
import 'package:flutter_application/pages/homepage.dart';
// import 'package:flutter_application/pages/NewTask.dart';
import 'package:flutter_application/helperpages/routes.dart';
import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return MaterialApp(
              // home: homePage(),
              themeMode: ThemeMode.dark,
              theme: ThemeData(primarySwatch: Colors.deepPurple),
              debugShowCheckedModeBanner: false,
              routes: {
                "/": (context) => const LoginPage(),
                MyRoutes.loginRoute: (context) => LoginPage(),
                MyRoutes.homeRoute: (context) => Homepage(UserName: "", Emailid: ""),
                MyRoutes.ProfileRoute: (context) => const MyProfile(),
                MyRoutes.SettingRoute: (context) => SettingsScreen(),
                MyRoutes.ContactRoute: (context) => const MyContact(),
                MyRoutes.QuitRoute: (context) => const Quit(),
                // MyRoutes.EmptyRoute: (context) => EmptyList(
                //       Title: "Empty List",
                //       Discription: "",
                //       date:"",
                //     ),
                // MyRoutes.NewTaskRoute: (context) => NewTask(),
                MyRoutes.EmptyRoute: (context) => MyTask(),
              },
            );
          },
        );
      },
    );
  }
}

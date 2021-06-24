import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Your Profile"),
      ),
      body: Container(
        child: Center(
            child: Text(
          "Will Be Ready In Next Update",
          style: TextStyle(
            color: Colors.deepOrange,
          ),
        )),
      ),
    );
  }
}
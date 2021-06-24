import 'package:flutter/material.dart';

class Quit extends StatelessWidget {
  const Quit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Quit Game"),
      ),
      body: Container(
        child: Center(
            child: Text(
          "Thank You!",
          textScaleFactor: 4.0,
          style: TextStyle(
            color: Colors.deepOrange,
          ),
        )),
      ),
    );
  }
}
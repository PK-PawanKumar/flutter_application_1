import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/helperpages/routes.dart';

class MyContact extends StatefulWidget {
  const MyContact({Key? key}) : super(key: key);

  @override
  State<MyContact> createState() => _MyContactState();
}

class _MyContactState extends State<MyContact> {
  void DisplayQuiriesScreen() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.deepOrange,
            title: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Center(
                        child: Text(
                      "Youe Quiries has been submitted",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Center(
                  child: Text(
                    "Go to Homepage",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.homeRoute);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Contact Us"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              // Image.asset(
              //   "ssests/images/login.png",
              //   fit: BoxFit.cover,
              // ),
              SizedBox(
                height: 60,
              ),
              Center(
                child: Text(
                  "SORRY FOR THE INCONVENIENCE",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                  textScaleFactor: 1.0,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                      labelText: ("Quiries"), hintText: ("Enter Your quiries")),
                ),
              ),

              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        CupertinoIcons.check_mark,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Submit Your Quries",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    DisplayQuiriesScreen();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

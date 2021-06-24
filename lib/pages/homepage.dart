import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/pages/MyTask.dart';
import 'package:flutter_application/pages/drawer.dart';
import 'package:flutter_application/helperpages/routes.dart';

class Homepage extends StatefulWidget {
  var UserName;
  var Emailid;
  Homepage({Key? key, required this.UserName, required this.Emailid})
      : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    setState(() {
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "TO DO",
        ),
      ),
      drawer: MyDrawer(
        Name: widget.UserName,
        Email: widget.Emailid,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10.0,
            shadowColor: Colors.deepPurple,
            borderOnForeground: false,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(color: Colors.deepPurple[50]),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/login1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Center(
                        child: Text(
                          " ToolTips",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                          textScaleFactor: 2.0,
                        ),
                      ),
                      Center(
                        child: Text(
                          " Read tooltips to know about features to use this app",
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.normal,
                            color: Colors.deepPurple,
                          ),
                          textScaleFactor: 2.0,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          height: 10,
                        ),
                      ),
                      Padding(
                        // padding: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 32.0),
                        child: Column(children: [
                          
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("1. Click on + to add your task")),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("2. Click on delete icon to deleate your task")),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("3. Click on status  to change status of task")),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("4. Click on alarm icon to turn off and off notification for your task")),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("5. Reamimng bug will be updated soon Thank you!")),
                          SizedBox(
                            height: 30.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 60),
                            child: ElevatedButton(
                                child: Row(
                                  children: [
                                    Icon(Icons.add_task),
                                    Text(
                                      "  See Your Todo List",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                style: TextButton.styleFrom(
                                    minimumSize: Size(180, 40)),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, MyRoutes.EmptyRoute);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => EmptyList(Title: "", Discription: "", date: "date")
                                  //   ),
                                  // );
                                  print("hello");
                                }),
                          ),
                          SizedBox(
                            height: 180,
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

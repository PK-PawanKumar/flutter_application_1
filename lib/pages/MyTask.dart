import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application/helperpages/checkbox.dart';
import 'package:flutter_application/helperpages/Sqlite.dart';

class MyTask extends StatefulWidget {
  @override
  _MyTaskState createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  final dbhelper = Databasehelper.instance;

  final titlecontroller = TextEditingController();
  final discriptioncontroller = TextEditingController();
  final datecontroller = TextEditingController();
  String status = 'Pending';
  var _iconColor = Colors.green[600];
  var _StatusColor = Colors.deepOrange;
  bool checkBoxValue = false;
  bool validated = true;
  String errortext = "";
  String TaskTitle = "";
  String Taskdes = "";
  String Taskdate = "";
  int num = -1;
  var myitems = [];
  List<Widget> children = [];

  void addtodo() {
    Map<String, dynamic> row = {
      Databasehelper.columnName: TaskTitle,
      // Databasehelper.columnDes: Taskdes,
      // Databasehelper.columnDate: Taskdate,
    };
    final id = dbhelper.insert(row);
    print(id);
    Navigator.pop(context);
    TaskTitle = "";
    Taskdes = "";
    setState(() {
      validated = true;
      errortext = "";
    });
  }

  Future<bool> query() async {
    myitems = [];
    children = [];
    var allrows = await dbhelper.queryall();
    allrows.forEach((row) {
      myitems.add(row.toString());
      children.add(
        Card(
          color: Colors.deepPurple[200],
          shadowColor: Colors.deepPurple,
          elevation: 15.0,
          margin: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.deepPurple[200],
                borderRadius: BorderRadius.circular(50)),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
              children: [
                Container(
                  child: ListTile(
                    leading: Container(
                      child: Icon(
                        Icons.pending_actions,
                        color: Colors.deepPurple,
                        size: 35,
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        row['todo'],
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Text(
                      'discriptions ^',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          editTask();
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 15),
                          child: TextButton(
                            child: Row(
                              children: [
                                Text(
                                  "Status :  ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  "$status",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: _StatusColor),
                                ),
                              ],
                            ),
                            onPressed: () {
                              setState(() {
                                if (status == "Completed") {
                                  status = "  Pending  ";
                                  _StatusColor = Colors.deepOrange;
                                } else {
                                  status = "Completed";
                                  _StatusColor = Colors.indigo;
                                }
                              });
                            },
                          ),
                        )),
                    SizedBox(
                      width: 60,
                    ),
                    Row(
                      children: [
                        Container(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.alarm,
                                  color: _iconColor,
                                  size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (_iconColor == Colors.red) {
                                      _iconColor = Colors.green[600];
                                    } else {
                                      _iconColor = Colors.red;
                                    }
                                  });
                                },
                              ),
                            )),
                        Container(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    num = num - 1;
                                    dbhelper.deletedata(row['id']);
                                  });
                                },
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
    return Future.value(true);
  }

  void showalertdialog() {
    if (Platform.isAndroid) {
      SingleChildScrollView();
    }
    titlecontroller.text = "";
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.deepPurple[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      children: [
                        Icon(
                          Icons.pending_actions,
                          color: Colors.deepPurple,
                        ),
                        Text(
                          "Enter details",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: titlecontroller,
                    onChanged: (_val) {
                      TaskTitle = _val;
                    },
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                        errorText: validated ? null : errortext,
                        labelText: "Title",
                        hintText: "Add title to you task"),
                  ),
                  TextField(
                    // controller: discriptioncontroller,
                    onChanged: (_val) {
                      Taskdes = _val;
                    },
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                        labelText: "Discription",
                        hintMaxLines: 3,
                        hintText: "Add some discription"),
                  ),
                  TextField(
                    // controller: discriptioncontroller,
                    onChanged: (_val) {
                      Taskdate = _val;
                    },
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                        labelText: "Date",
                        // hintMaxLines: 3,
                        hintText: "Add deadline"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListCheckBox(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            num++;
                            if (titlecontroller.text.isEmpty) {
                              setState(() {
                                errortext = "Can't Be Empty";
                                validated = false;
                              });
                            } else {
                              num = num + 1;
                              print("added num =");
                              print(num);
                              addtodo();
                            }
                          },
                          color: Colors.deepPurple,
                          child: Text("ADD TASK",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyTask(),
                              ),
                            );
                          },
                          color: Colors.deepPurple,
                          child: Text(" CANCEL .",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  void editTask() {
    // titlecontroller.text = "";
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.deepPurple[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Row(
                    children: [
                      Icon(
                        Icons.pending_actions,
                        color: Colors.deepPurple,
                      ),
                      Text(
                        "Edit details",
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ],
                  ),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: titlecontroller,
                    onChanged: (_val) {
                      TaskTitle = _val;
                    },
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                        errorText: validated ? null : errortext,
                        labelText: "Title",
                        hintText: "Edit title to you task"),
                  ),
                  TextField(
                    controller: discriptioncontroller,
                    onChanged: (_val) {
                      Taskdes = _val;
                    },
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                        labelText: "Discription",
                        hintMaxLines: 3,
                        hintText: "Edit discription"),
                  ),
                  TextField(
                    controller: datecontroller,
                    onChanged: (_val) {
                      Taskdate = _val;
                    },
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                        labelText: "Date", hintText: "Edit deadline"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListCheckBox(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            if (titlecontroller.text.isEmpty) {
                              setState(() {
                                errortext = "Can't Be Empty";
                                validated = false;
                              });
                            } else {
                              // addtodo();
                              setState(() {
                                num = num + 1;
                                print("updated num =");
                                print(num);
                                dbhelper.deletedata(num);
                                // Navigator.pop(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => MyTask(),
                                //   ),
                                // );
                                addtodo();
                              });
                            }
                          },
                          color: Colors.deepPurple,
                          child: Text("Update",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyTask(),
                              ),
                            );
                          },
                          color: Colors.deepPurple,
                          child: Text(" CANCEL .",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snap) {
        if (snap.hasData == null) {
          return Center(
            child: Text(
              "No Data",
            ),
          );
        } else {
          if (myitems.length == 0) {
            num =0;
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: showalertdialog,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.deepPurple,
              ),
              appBar: AppBar(
                backgroundColor: Colors.deepPurple,
                centerTitle: true,
                title: Text(
                  "My Tasks",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              backgroundColor: Colors.deepPurple[100],
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100, vertical: 350),
                  child: Column(
                    children: [
                      Icon(
                        Icons.pending_actions,
                        color: Colors.deepOrange,
                      ),
                      Text(
                        "No Task Avaliable",
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: FloatingActionButton(
                onPressed: showalertdialog,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.deepPurple,
              ),
              appBar: AppBar(
                backgroundColor: Colors.deepPurple,
                centerTitle: true,
                title: Text(
                  "My Tasks",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                ],
              ),
              backgroundColor: Colors.deepPurple[100],
              body: SingleChildScrollView(
                child: Column(
                  children: children,
                ),
              ),
            );
          }
        }
      },
      future: query(),
    );
  }
}

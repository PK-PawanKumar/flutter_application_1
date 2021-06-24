import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/pages/homepage.dart';
import 'package:form_field_validator/form_field_validator.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final NameController = TextEditingController();
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();

  void validate() {
    if (_formkey.currentState!.validate()) {
      print("validated");
      GoToHomePage();
    } else {
      print("not validated");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  void GoToHomePage() {
    String sendname = NameController.text;
    String sendemail = EmailController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Homepage(
          UserName: sendname,
          Emailid: sendemail,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      resizeToAvoidBottomInset: false,
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
          // title: Text("Game-1"),
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
                child: Center(
                  child: Form(
                    key: _formkey,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Image.asset(
                          "assets/images/login1.png",
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Text(
                          " LOGIN ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                          textScaleFactor: 2.0,
                        ),
                        Text(
                          " You have to login Once to keep your to-do list safe",
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.normal,
                            color: Colors.deepPurple,
                          ),
                          textScaleFactor: 2.0,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          // padding: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 32.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  obscureText: false,
                                  controller: NameController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: ("Username"),
                                    hintText: ("Enter Your Name"),
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "Required *"),
                                    MinLengthValidator(4,
                                        errorText:
                                            "Username should atleast 4 characters")
                                  ]),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  obscureText: false,
                                  controller: EmailController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: ("Email-id"),
                                    hintText: ("Enter Your Email-id"),
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "Required *"),
                                    EmailValidator(
                                        errorText: "Not a valid email")
                                  ]),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  obscureText: true,
                                  controller: PasswordController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: ("Password"),
                                    hintText: ("Enter password"),
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "Required *"),
                                    MinLengthValidator(8,
                                        errorText:
                                            "password should atleast 8 characters")
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 140),
                          child: ElevatedButton(
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.pencil_outline),
                                Text(
                                  "    Login",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            style: TextButton.styleFrom(
                                minimumSize: Size(180, 40)),
                            onPressed: validate,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      // ),
    );
  }
}

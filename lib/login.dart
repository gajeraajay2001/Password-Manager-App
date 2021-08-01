import 'package:flutter/material.dart';
import 'package:temp1/temp.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    ),
  );
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  IconData _iconData = Icons.visibility_off;
  bool _permission = true;
  String uname, pass;
  int count, index, temp;
  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Are you sure?"),
              content: Text("Do you want to exit an app?"),
              actions: <Widget>[
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("No"),
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("Yes"),
                )
              ],
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("images/back.jpg")),
            ),
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    validator: (val) {
                      if (val.length < 4) {
                        return "Enter at least 4 character of Name.";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        uname = val;
                      });
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.people),
                      border: OutlineInputBorder(),
                      labelText: "Name",
                      hintText: "Enter name here.",
                    ),
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (val) {
                      if (val.length < 4) {
                        return "Enter at least 4 character of Password.";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        pass = val;
                      });
                    },
                    obscureText: _permission,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      border: OutlineInputBorder(),
                      hintText: "Enter password here.",
                      labelText: "Password",
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            if (_permission == true) {
                              _permission = false;
                              _iconData = Icons.visibility;
                            } else {
                              _permission = true;
                              _iconData = Icons.visibility_off;
                            }
                          });
                        },
                        child: Icon(_iconData),
                      ),
                    ),
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        count = 0;
                        index = 0;
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          Temp.l.forEach((element) {
                            index++;
                            if (uname == element.uname &&
                                pass == element.password) {
                              temp = index - 1;
                              count++;
                            }
                          });
                          if (count > 0) {
                            Navigator.of(context)
                                .pushNamed("second/", arguments: temp);
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Invalid Input"),
                                  );
                                });
                          }
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 20),
                      )),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("sign/");
                    },
                    child: Text(
                      "Create an account",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

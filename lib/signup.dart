import 'package:flutter/material.dart';
import 'package:temp1/temp.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKeySign = GlobalKey<FormState>();
  String uname, pass;
  IconData _iconData = Icons.visibility_off;
  bool _permission = true;
  int count, index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("images/back.jpg")),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKeySign,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.name,
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
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
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
                    if (_formKeySign.currentState.validate()) {
                      _formKeySign.currentState.save();
                      index = 0;
                      Temp.l.forEach(
                        (element) {
                          index++;
                          if (uname == element.uname &&
                              pass == element.password) {
                            count++;
                          }
                        },
                      );
                      if (count == 0) {
                        Temp.l.add(Temp(uname: uname, password: pass));
                        Navigator.of(context)
                            .pushNamed("second/", arguments: index);
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("User alredy exist"),
                            );
                          },
                        );
                      }
                    }
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:temp1/temp.dart';
import 'dart:ui';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final TextEditingController _instapass = TextEditingController();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  IconData _iconData2 = Icons.visibility_off;
  bool _permission2 = true;
  String _password;
  void clearText() {
    _instapass.clear();
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Are you sure?"),
              content: Text("Do you want to Log Out?"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("No"),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).popUntil(ModalRoute.withName('/'));
                  },
                  child: Text("Yes"),
                )
              ],
            );
          },
        ) ??
        false;
  }

  Widget _button(buildcontext, String text1, String text2, String text3,
      var image1, String name, Widget _button1) {
    return FlatButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(text1),
              content: Container(
                height: 180,
                child: Column(
                  children: [
                    Form(
                      key: _formKey2,
                      child: Column(
                        children: [
                          TextFormField(
                            obscureText: _permission2,
                            validator: (val) {
                              if (val.length < 1 || val.length > 9) {
                                return "Password's length must be between 1 to 8.";
                              }
                              return null;
                            },
                            autofocus: true,
                            keyboardType: TextInputType.visiblePassword,
                            controller: _instapass,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: text2,
                              labelText: text3,
                              suffix: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (_permission2 == true) {
                                      _iconData2 = Icons.visibility;
                                      _permission2 = false;
                                      print("if..$_permission2...........");
                                    } else {
                                      _permission2 = true;
                                      _iconData2 = Icons.visibility_off;
                                      print(
                                          "else....$_permission2............");
                                    }
                                  });
                                },
                                child: Icon(_iconData2),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          _button1,
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xff98506D),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 100,
              child: Image(
                image: AssetImage(image1),
              ),
            ),
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context).settings.arguments;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          decoration: BoxDecoration(
            color: Color(0xffFF994C),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 10),
                Container(
                  height: 60,
                  width: 310,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xffD0605E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Welcome ${Temp.l[index].uname}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                _button(
                  context,
                  "Enter Instagram password here",
                  "Enter password here.",
                  "Password",
                  "images/Insta_icon.png",
                  "Instagram",
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey2.currentState.validate()) {
                        setState(
                          () {
                            _password = _instapass.text;
                            if (_password.length < 1)
                              Temp.l[index].insta = "No Password";
                            else
                              Temp.l[index].insta = _password;
                            Navigator.of(context).pop();
                            clearText();
                          },
                        );
                      } else
                        clearText();
                    },
                    child: Text("Save"),
                  ),
                ),
                SizedBox(height: 10),
                _button(
                  context,
                  "Enter Facebook password here",
                  "Enter password here.",
                  "Password",
                  "images/facebook.png",
                  "Facebook",
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          _password = _instapass.text;
                          if (_password.length < 1)
                            Temp.l[index].facebook = "No Password";
                          else
                            Temp.l[index].facebook = _password;
                          Navigator.of(context).pop();
                          clearText();
                        },
                      );
                    },
                    child: Text("Save"),
                  ),
                ),
                SizedBox(height: 10),
                _button(
                  context,
                  "Enter Snapchat password here",
                  "Enter password here.",
                  "Password",
                  "images/snapchat.png",
                  "Snapchat",
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          _password = _instapass.text;
                          if (_password.length < 1)
                            Temp.l[index].snapchat = "No Password";
                          else
                            Temp.l[index].snapchat = _password;
                          Navigator.of(context).pop();
                          clearText();
                        },
                      );
                    },
                    child: Text("Save"),
                  ),
                ),
                SizedBox(height: 10),
                _button(
                  context,
                  "Enter telegram password here",
                  "Enter password here.",
                  "Password",
                  "images/telegram.png",
                  "Telegram",
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          _password = _instapass.text;
                          if (_password.length < 1)
                            Temp.l[index].telegram = "No Password";
                          else
                            Temp.l[index].telegram = _password;
                          Navigator.of(context).pop();
                          clearText();
                        },
                      );
                    },
                    child: Text("Save"),
                  ),
                ),
                SizedBox(height: 10),
                _button(
                  context,
                  "Enter twitter password here",
                  "Enter password here.",
                  "Password",
                  "images/twitter.png",
                  "Twitter",
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          _password = _instapass.text;
                          if (_password.length < 1)
                            Temp.l[index].twitter = "No Password";
                          else
                            Temp.l[index].twitter = _password;
                          Navigator.of(context).pop();
                          clearText();
                        },
                      );
                    },
                    child: Text("Save"),
                  ),
                ),
                SizedBox(height: 10),
                _button(
                  context,
                  "Enter gmail password here",
                  "Enter password here.",
                  "Password",
                  "images/gmail.png",
                  "Gmail",
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          _password = _instapass.text;
                          if (_password.length < 1)
                            Temp.l[index].gmail = "No Password";
                          else
                            Temp.l[index].gmail = _password;
                          Navigator.of(context).pop();
                          clearText();
                        },
                      );
                    },
                    child: Text("Save"),
                  ),
                ),
                SizedBox(height: 10),
                _button(
                  context,
                  "Enter flipkart password here",
                  "Enter password here.",
                  "Password",
                  "images/flipkart.png",
                  "Flipkart",
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          _password = _instapass.text;
                          if (_password.length < 1)
                            Temp.l[index].flipkart = "No Password";
                          else
                            Temp.l[index].flipkart = _password;
                          Navigator.of(context).pop();
                          clearText();
                        },
                      );
                    },
                    child: Text("Save"),
                  ),
                ),
                SizedBox(height: 10),
                _button(
                  context,
                  "Enter gpay password here",
                  "Enter password here.",
                  "Password",
                  "images/gpay.png",
                  "Gpay",
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          _password = _instapass.text;
                          if (_password.length < 1)
                            Temp.l[index].gpay = "No Password";
                          else
                            Temp.l[index].gpay = _password;
                          Navigator.of(context).pop();
                          clearText();
                        },
                      );
                    },
                    child: Text("Save"),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 60,
                  width: 310,
                  decoration: BoxDecoration(
                    color: Color(0xffD0605E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('showList/', arguments: index);
                    },
                    child: Text(
                      "Show Passwords ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
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

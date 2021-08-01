import 'package:flutter/material.dart';
import 'package:temp1/login.dart';
import 'package:temp1/second.dart';
import 'package:temp1/showlist.dart';
import 'package:temp1/signup.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/": (context) => Login(),
        "sign/": (context) => SignUp(),
        "second/": (context) => Second(),
        "showList/": (context) => ShowList(),
      },
    ),
  );
}

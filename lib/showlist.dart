import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:temp1/temp.dart';

class ShowList extends StatefulWidget {
  @override
  _ShowListState createState() => _ShowListState();
}

Widget _button(String _image, Widget _text) {
  return FlatButton(
    onPressed: () {},
    child: Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff4BA8D7).withOpacity(0.8),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 100,
            child: Image(
              image: AssetImage(_image),
            ),
          ),
          _text,
        ],
      ),
    ),
  );
}

class _ShowListState extends State<ShowList> {
  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff0f0c29),
              Color(0xff302b63),
              Color(0xff24243e),
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _button(
              "images/Insta_icon.png",
              Text(
                Temp.l[index].insta,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            _button(
              "images/facebook.png",
              Text(
                Temp.l[index].facebook,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            _button(
              "images/snapchat.png",
              Text(
                Temp.l[index].snapchat,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            _button(
              "images/telegram.png",
              Text(
                Temp.l[index].telegram,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            _button(
              "images/twitter.png",
              Text(
                Temp.l[index].twitter,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            _button(
              "images/gmail.png",
              Text(
                Temp.l[index].gmail,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            _button(
              "images/flipkart.png",
              Text(
                Temp.l[index].flipkart,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            _button(
              "images/gpay.png",
              Text(
                Temp.l[index].gpay,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 60,
              width: 310,
              decoration: BoxDecoration(
                color: Color(0xffE7B22C),
                borderRadius: BorderRadius.circular(10),
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Go Back",
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
    );
  }
}

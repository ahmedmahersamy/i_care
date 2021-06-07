import 'dart:async';

import 'package:flutter/material.dart';
import 'package:i_care/View/Login.dart';

class Splashscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MySplashScreen();
  }
}

class _MySplashScreen extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyLogo(),
    );
  }
}

class MyLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 500,
      padding: EdgeInsets.all(30),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("Images/doctor.jpg"),
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
        ),
      ),
      /*Image.asset(
        "Images/doctor.jpg",
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),*/
    );
  }
}

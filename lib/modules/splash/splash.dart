
//splash screen-------------------------------------------------------------
//-----------------------------------------------------------------------------
import 'dart:async';

import 'package:firebasecourse/layout/newsApp/news_layout.dart';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => NewsLayout())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white70,
      body:Center(
        child: Text("Nafed News",style: TextStyle(
          color:  Colors.deepOrange,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),),
      )
    );
  }
}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/screen2.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(splashColor: Colors.transparent,highlightColor: Colors.transparent),
  ));
}

class MyApp extends StatefulWidget {
  app createState() => app();
}

class app extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => mainScreen()));
    });
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/logo.png",
          height: 130,
          width: 130,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

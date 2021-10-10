import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),
        () => Navigator.pushNamed(context, '/landing-page'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      body: Center(
        child: Image.asset(
          "assets/logo.png",
          width: 200,
        ),
      ),
    );
  }
}

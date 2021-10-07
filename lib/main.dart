import 'package:flutter/material.dart';
import 'package:mie_ayu_rawalumbu/splash_screen.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: backgroundColor2,
      body: SplashScreen(),
    ));
  }
}

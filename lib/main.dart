import 'package:flutter/material.dart';
import 'package:mie_ayu_rawalumbu/pages/detail_page.dart';
import 'package:mie_ayu_rawalumbu/pages/landing_page.dart';
import 'package:mie_ayu_rawalumbu/pages/splash_page.dart';
import 'package:mie_ayu_rawalumbu/pages/test_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SplashPage(),
        '/landing-page': (context) => LandingPage(),
        '/detail-page' : (context) => DetailPage()
      },
    );
  }
}

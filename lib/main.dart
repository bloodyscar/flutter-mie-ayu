import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/pages/AuthPage/registration_page.dart';
import 'package:mie_ayu_rawalumbu/pages/HomePage/home_page.dart';
import 'package:mie_ayu_rawalumbu/pages/IntroPage/intro_page.dart';
import 'package:mie_ayu_rawalumbu/pages/login_page.dart';
import 'package:mie_ayu_rawalumbu/pages/login_screen.dart';
import 'package:mie_ayu_rawalumbu/pages/map_screen.dart';

import 'package:mie_ayu_rawalumbu/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapScreen(),
      // routes: {
      //   '/': (context) => SplashPage(),
      //   '/intro-page': (context) => IntroPage(),
      //   '/home-page': (context) => HomePage(),
      // '/landing-page': (context) => LandingPage(),
      // '/detail-page' : (context) => DetailPage()
      // },
    );
  }
}

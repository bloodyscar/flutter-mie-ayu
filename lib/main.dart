import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/map_page.dart';
import 'package:mie_ayu_rawalumbu/pages/AuthPage/registration_page.dart';
import 'package:mie_ayu_rawalumbu/pages/HomePage/home_page.dart';
import 'package:mie_ayu_rawalumbu/pages/IntroPage/intro_page.dart';
import 'package:mie_ayu_rawalumbu/pages/detail_page.dart';
import 'package:mie_ayu_rawalumbu/pages/login_page.dart';
import 'package:mie_ayu_rawalumbu/pages/login_screen.dart';
import 'package:mie_ayu_rawalumbu/pages/map_screen.dart';

import 'package:mie_ayu_rawalumbu/pages/splash_page.dart';
import 'package:mie_ayu_rawalumbu/provider/google_map_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GoogleMapProvider>(
      create: (context) => GoogleMapProvider(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // home: IntroPage(),
        routes: {
          '/': (context) => SplashPage(),
          '/intro-page': (context) => IntroPage(),
          '/login-page': (context) => LoginPage(),
          '/home-page': (context) => HomePage(),
        },
      ),
    );
  }
}

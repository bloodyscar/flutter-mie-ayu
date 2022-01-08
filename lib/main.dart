import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/pages/CategoryPage/detail_category_page.dart';
import 'package:mie_ayu_rawalumbu/pages/HomePage/home_page.dart';
import 'package:mie_ayu_rawalumbu/pages/IntroPage/intro_page.dart';
import 'package:mie_ayu_rawalumbu/pages/detail_page.dart';
import 'package:mie_ayu_rawalumbu/pages/login_page.dart';

import 'package:mie_ayu_rawalumbu/pages/splash_page.dart';
import 'package:mie_ayu_rawalumbu/provider/category_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/google_map_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/product_provider.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<GoogleMapProvider>(
            create: (context) => GoogleMapProvider()),
        ListenableProvider<ProductProvider>(
            create: (context) => ProductProvider()),
        ListenableProvider<CategoryProvider>(
            create: (context) => CategoryProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "IBM Plex Sans",
        ),
        // home: HomeScreen(),
        routes: {
          '/': (context) => SplashPage(),
          '/intro-page': (context) => IntroPage(),
          '/login-page': (context) => LoginPage(),
          '/home-page': (context) => HomePage(),
          '/detail-page': (context) => DetailPage(),
          '/detail-category-page': (context) => DetailCategoryPage(),
        },
      ),
    );
  }
}

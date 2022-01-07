import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/map_page.dart';
import 'package:mie_ayu_rawalumbu/pages/AuthPage/registration_page.dart';
import 'package:mie_ayu_rawalumbu/pages/CategoryPage/category_page.dart';
import 'package:mie_ayu_rawalumbu/pages/ChatPage/chat_page.dart';
import 'package:mie_ayu_rawalumbu/pages/HomePage/home_page.dart';
import 'package:mie_ayu_rawalumbu/pages/IntroPage/intro_page.dart';
import 'package:mie_ayu_rawalumbu/pages/detail_page.dart';
import 'package:mie_ayu_rawalumbu/pages/login_page.dart';
import 'package:mie_ayu_rawalumbu/pages/login_screen.dart';
import 'package:mie_ayu_rawalumbu/pages/map_screen.dart';

import 'package:mie_ayu_rawalumbu/pages/splash_page.dart';
import 'package:mie_ayu_rawalumbu/provider/google_map_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/product_provider.dart';
import 'package:mie_ayu_rawalumbu/widget/category_list_widget.dart';
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
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // home: ChatPage(),
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

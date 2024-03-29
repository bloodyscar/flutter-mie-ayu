import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/map_page.dart';
import 'package:mie_ayu_rawalumbu/pages/CartPage/cart_page.dart';
import 'package:mie_ayu_rawalumbu/pages/CategoryPage/detail_category_page.dart';
import 'package:mie_ayu_rawalumbu/pages/HomePage/home_page.dart';
import 'package:mie_ayu_rawalumbu/pages/IntroPage/intro_page.dart';
import 'package:mie_ayu_rawalumbu/pages/TransactionPage/checkout_page.dart';
import 'package:mie_ayu_rawalumbu/pages/detail_page.dart';
import 'package:mie_ayu_rawalumbu/pages/login_page.dart';
import 'package:mie_ayu_rawalumbu/pages/main_page.dart';

import 'package:mie_ayu_rawalumbu/pages/splash_page.dart';
import 'package:mie_ayu_rawalumbu/provider/auth_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/cart_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/category_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/favourite_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/google_map_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/product_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/transaction_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
          create: (context) => CategoryProvider(),
        ),
        ListenableProvider<CartProvider>(
          create: (context) => CartProvider(),
        ),
        ListenableProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ListenableProvider<TransactionProvider>(
          create: (context) => TransactionProvider(),
        ),
        ListenableProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ListenableProvider<FavouriteProvider>(
          create: (context) => FavouriteProvider(),
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'splash-page',
          theme: ThemeData(
            fontFamily: "IBM Plex Sans",
          ),
          // home: HomeScreen(),
          routes: {
            'splash-page': (context) => SplashPage(),
            'intro-page': (context) => IntroPage(),
            '/login-page': (context) => LoginPage(),
            '/main-page': (context) => MainPage(),
            '/home-page': (context) => HomePage(),
            '/detail-page': (context) => DetailPage(),
            '/cart-page': (context) => CartPage(),
            '/checkout-page': (context) => CheckoutPage(),
            '/detail-category-page': (context) => DetailCategoryPage(),
            '/map-page': (context) => MapPage(),
          },
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/pages/IntroPage/intro_page.dart';
import 'package:mie_ayu_rawalumbu/provider/category_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/product_provider.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInit();
    Timer(Duration(seconds: 3), () {
      Get.to(() => IntroPage());
    });
    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    await Provider.of<CategoryProvider>(context, listen: false).getCategories();
    Timer(Duration(seconds: 3), () {
      Get.to(() => IntroPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      body: Center(
        child: Image.asset(
          "assets/logo_splash.png",
          width: 280,
          height: 317.46,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

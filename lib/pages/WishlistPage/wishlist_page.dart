import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Text(
          "Wishlist Page",
          style: primartyTextStyle.copyWith(fontSize: 24),
        ),
      ),
    );
  }
}

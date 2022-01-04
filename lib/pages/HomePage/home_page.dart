import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/pages/map_screen.dart';
import 'package:mie_ayu_rawalumbu/service/auth_service.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsive = MediaQuery.of(context).size;

    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => MapScreen());
                  },
                  child: Row(
                    children: [
                      Text(
                        "Change Location",
                        style: secondaryTextStyle,
                      ),
                      Image.asset(
                        "assets/pin.png",
                        width: 24,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/avatar.png"),
                          fit: BoxFit.cover)),
                )
              ],
            ),
            Container(
              width: responsive.width * 0.5,
              child: Text(
                "Jalan Pariwisata Raya Bumi Bekasi Baru",
                style: secondaryTextStyle.copyWith(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                    fontWeight: medium),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: responsive.height * 0.35,
          decoration: BoxDecoration(
            color: backgroundColor1,
          ),
        ),
        Container(
          width: double.infinity,
          height: responsive.height * 0.35,
          decoration: BoxDecoration(
            color: backgroundColor2,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(48),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: responsive.height * 0.35),
          decoration: BoxDecoration(
            color: backgroundColor2,
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: responsive.height * 0.35),
          decoration: BoxDecoration(
            color: backgroundColor1,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(48),
            ),
          ),
        ),
        ListView(
          children: [
            header(),
          ],
        )
      ],
    ));
  }
}

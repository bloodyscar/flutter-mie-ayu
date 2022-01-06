import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/pages/login_page.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:mie_ayu_rawalumbu/widget/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundIntro() {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/intro-2.png"), fit: BoxFit.cover),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
        child: Column(
          children: [
            Text(
              "Kemudahan dalam pemesanan makanan",
              style:
                  secondaryTextStyle.copyWith(fontSize: 20, fontWeight: bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Bebas pusing urusan pesan makanan dengan memesan secara online",
                style: secondaryTextStyle.copyWith(
                    fontSize: 14, fontWeight: medium),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Container(
                  width: 15,
                  height: 10,
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.to(LoginPage());
                    },
                    child: Text("LOGIN"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Button(
                      title: "Register",
                      width: 146,
                      height: 50,
                      bgColor: Colors.black,
                      textColor: Colors.white,
                      textSize: 18),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          backgroundIntro(),
          content(),
        ],
      ),
    );
  }
}

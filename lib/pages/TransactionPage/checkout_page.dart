import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor1,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/checkout.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "Please Transfer to",
                style: primartyTextStyle.copyWith(fontSize: 14),
              ),
              Text(
                "Virtual Account Number 26184706832",
                style: primartyTextStyle.copyWith(fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Thanks for your Order",
                style: primartyTextStyle.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: backgroundColor2,
                ),
                child: GestureDetector(
                    onTap: () {
                      Get.offAllNamed("/main-page");
                    },
                    child: Center(child: Text("DONE"))),
              )
            ],
          ),
        ));
  }
}

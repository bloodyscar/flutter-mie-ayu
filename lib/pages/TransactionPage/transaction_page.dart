import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mie_ayu_rawalumbu/map_page.dart';
import 'package:mie_ayu_rawalumbu/models/cart_model.dart';
import 'package:mie_ayu_rawalumbu/pages/HomePage/home_page.dart';
import 'package:mie_ayu_rawalumbu/pages/TransactionPage/checkout_page.dart';
import 'package:mie_ayu_rawalumbu/pages/TransactionPage/transaction_page.dart';
import 'package:mie_ayu_rawalumbu/provider/auth_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/cart_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/google_map_provider.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:mie_ayu_rawalumbu/widget/button.dart';
import 'package:mie_ayu_rawalumbu/widget/cart_list_widget.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    List<CartModel> carts = cartProvider.carts;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    GoogleMapProvider providerGoogle = Provider.of<GoogleMapProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    String getCurrentDate() {
      var date = DateTime.now().toString();

      var dateParse = DateTime.parse(date);

      var formattedDate = "${dateParse.month}-${dateParse.day}";

      return formattedDate.toString();
    }

    String getCurrentTime() {
      var date = DateTime.now().toString();

      var dateParse = DateTime.parse(date);
      int time = dateParse.minute;

      var formattedTime = "${dateParse.hour}:${dateParse.minute}";

      return formattedTime.toString();
    }

    String getFutureTime() {
      var date = DateTime.now().toString();
      var timeZero = DateTime.now().add(
        Duration(minutes: 40),
      );

      var parseString = timeZero.toString();

      var dateParse = DateTime.parse(date);
      var parse = DateTime.parse(parseString);

      int time = dateParse.minute + 20;
      if (dateParse.minute + 20 >= 60) {
        String resetTime = time.toString() + 0.toString().padLeft(2, "0");
      }

      var formattedTime = "${dateParse.hour}:${parse.minute}";

      return formattedTime.toString();
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      bottomNavigationBar: cartProvider.carts.length > 0
          ? BottomAppBar(
              clipBehavior: Clip.none,
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: boxDescriptionColor,
                height: height * 0.12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TOTAL HARGA",
                      style: primartyTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          NumberFormat.currency(
                                  locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                              .format(cartProvider.totalPrice()),
                          style: priceTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offAll(CheckoutPage());
                          },
                          child: Container(
                            width: width * 0.2,
                            height: height * 0.05,
                            decoration: BoxDecoration(
                              color: backgroundColor2,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "Bayar",
                                style:
                                    secondaryTextStyle.copyWith(fontSize: 16),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          : BottomAppBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: backgroundColor2,
        title: Text(
          "Pembayaran",
          textAlign: TextAlign.center,
          style: secondaryTextStyle.copyWith(fontSize: 16),
        ),
      ),
      body: carts.length > 0
          ? ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: carts
                        .map((item) => CartListWidget(
                              product: item.productModel!,
                              cart: item,
                            ))
                        .toList(),
                  ),
                ),
                Container(
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  color: boxDescriptionColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pilih Jasa Pengiriman",
                            style: primartyTextStyle.copyWith(fontSize: 16),
                          ),
                          Text(
                            "See All",
                            style: primartyTextStyle.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("assets/cour.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dianter sama Ibnu",
                                style: primartyTextStyle.copyWith(
                                    fontSize: 16, fontWeight: bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Rp 10.000",
                                    style: TextStyle(
                                      fontSize: 12,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    "FREE ONGKIR!!!",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: bold,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  color: boxDescriptionColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Metode Pembayaran",
                            style: primartyTextStyle.copyWith(fontSize: 16),
                          ),
                          Text(
                            "See All",
                            style: primartyTextStyle.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 80,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("assets/bca.png"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Bank Central Asiappp",
                            style: primartyTextStyle.copyWith(
                                fontSize: 16, fontWeight: bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                // START  Timeline
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: SizedBox(
                    height: 50,
                    child: TimelineTile(
                      indicatorStyle: IndicatorStyle(
                        color: Colors.red,
                        width: 35,
                        iconStyle: IconStyle(
                          iconData: Icons.place,
                          color: Colors.white,
                        ),
                      ),
                      isFirst: true,
                      alignment: TimelineAlign.manual,
                      lineXY: 0.2,
                      startChild: Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text("${getCurrentDate()}",
                              style: primartyTextStyle.copyWith(fontSize: 12)),
                          Text("${getCurrentTime()}",
                              style: primartyTextStyle.copyWith(fontSize: 12))
                        ],
                      ),
                      endChild: GestureDetector(
                        onTap: () {
                          Get.to(() => MapPage());
                        },
                        child: (providerGoogle.street == null)
                            ? Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "JALAN 404 NOT FOUND",
                                    style: primartyTextStyle.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: medium),
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${providerGoogle.street}",
                                    style: primartyTextStyle.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: medium),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: SizedBox(
                    height: 150,
                    child: TimelineTile(
                      alignment: TimelineAlign.manual,
                      lineXY: 0.2,
                      startChild: Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text("${getCurrentDate()}",
                              style: primartyTextStyle.copyWith(fontSize: 12)),
                          Text("${getFutureTime()}",
                              style: primartyTextStyle.copyWith(fontSize: 12))
                        ],
                      ),
                      indicatorStyle: IndicatorStyle(
                        color: Colors.green,
                        width: 35,
                        iconStyle: IconStyle(
                          iconData: Icons.flag,
                          color: Colors.white,
                        ),
                      ),
                      isLast: true,
                      endChild: GestureDetector(
                        onTap: () {
                          Get.to(() => MapPage());
                        },
                        child: (providerGoogle.street == null)
                            ? Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Mie Ayu Rawalumbu",
                                    style: primartyTextStyle.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: medium),
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Mie Ayu Rawalumbu",
                                    style: primartyTextStyle.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: medium),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                ),
                // END START TIMELINE
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.8,
                    height: height * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/empty-cart.png"),
                      ),
                    ),
                  ),
                  Text(
                    "Keranjang anda kosong",
                    style: primartyTextStyle.copyWith(
                        fontSize: 20, fontWeight: medium),
                  ),
                ],
              ),
            ),
    );
  }
}

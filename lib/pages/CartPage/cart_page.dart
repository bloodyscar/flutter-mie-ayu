import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mie_ayu_rawalumbu/map_page.dart';
import 'package:mie_ayu_rawalumbu/models/cart_model.dart';
import 'package:mie_ayu_rawalumbu/provider/cart_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/google_map_provider.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:mie_ayu_rawalumbu/widget/button.dart';
import 'package:mie_ayu_rawalumbu/widget/cart_list_widget.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    List<CartModel> carts = cartProvider.carts;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    GoogleMapProvider providerGoogle = Provider.of<GoogleMapProvider>(context);

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
                        Button(
                            title: "Beli",
                            width: width * 0.3,
                            height: height * 0.05,
                            bgColor: backgroundColor2,
                            textColor: Colors.black,
                            textSize: 16)
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
          "Keranjang",
          textAlign: TextAlign.center,
          style: secondaryTextStyle.copyWith(fontSize: 16),
        ),
      ),
      body: carts.length > 0
          ? ListView(
              scrollDirection: Axis.vertical,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => MapPage());
                  },
                  child: Container(
                    width: width * 0.5,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: boxDescriptionColor,
                    ),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: (providerGoogle.street == null)
                            ? Row(
                                children: [
                                  Icon(
                                    Icons.place,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    "JALAN 404 NOT FOUND",
                                    style: primartyTextStyle.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 14,
                                        fontWeight: medium),
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  Icon(
                                    Icons.place,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    "${providerGoogle.street}",
                                    style: primartyTextStyle.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: medium),
                                  ),
                                ],
                              )),
                  ),
                ),
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

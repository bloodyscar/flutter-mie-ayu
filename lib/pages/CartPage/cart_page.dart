import 'package:flutter/material.dart';
import 'package:mie_ayu_rawalumbu/models/cart_model.dart';
import 'package:mie_ayu_rawalumbu/provider/cart_provider.dart';
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
    print(carts.length);

    return Scaffold(
      backgroundColor: backgroundColor1,
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        notchMargin: 5,
        child: Button(
            title: "PAY NOW",
            width: width,
            height: height * 0.08,
            bgColor: backgroundColor2,
            textColor: backgroundColor1,
            textSize: 16),
        elevation: 1,
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor2,
        title: Text(
          "Cart Page",
          textAlign: TextAlign.center,
          style: secondaryTextStyle,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          (carts.length > 0)
              ? Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ListView(
                    children: carts
                        .map((item) => CartListWidget(
                              product: item.productModel!,
                              cart: item,
                            ))
                        .toList(),
                  ),
                )
              : Center(
                  child: Text(
                    "TIDAK ADA CART",
                    style: primartyTextStyle.copyWith(
                        fontSize: 20, fontWeight: semiBold),
                  ),
                ),
        ],
      ),
    );
  }
}

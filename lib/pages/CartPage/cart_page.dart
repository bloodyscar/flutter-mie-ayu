import 'package:flutter/material.dart';
import 'package:mie_ayu_rawalumbu/models/product_model.dart';
import 'package:mie_ayu_rawalumbu/provider/product_provider.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:mie_ayu_rawalumbu/widget/cart_list_widget.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> carts = productProvider.carts;
    print(carts.length);

    return Scaffold(
      backgroundColor: backgroundColor1,
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
      body: (carts.length > 0)
          ? ListView(
              children: carts
                  .map((item) => CartListWidget(
                        product: item,
                      ))
                  .toList(),
            )
          : Center(
              child: Text(
                "TIDAK ADA CART",
                style: primartyTextStyle.copyWith(
                    fontSize: 20, fontWeight: semiBold),
              ),
            ),
    );
  }
}

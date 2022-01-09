import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mie_ayu_rawalumbu/models/cart_model.dart';
import 'package:mie_ayu_rawalumbu/models/product_model.dart';
import 'package:mie_ayu_rawalumbu/pages/detail_page.dart';
import 'package:mie_ayu_rawalumbu/provider/cart_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/product_provider.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:provider/provider.dart';

class CartListWidget extends StatelessWidget {
  ProductModel product;
  CartModel cart;
  CartListWidget({Key? key, required this.product, required this.cart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // deleteFunction() async {
    //   if (await cartProvider.deleteCartByProduct(product)) {
    //     Get.snackbar(
    //       "HAPUS BERHASIL",
    //       "",
    //       duration: Duration(milliseconds: 1500),
    //       backgroundColor: Colors.red,
    //     );
    //   }
    // }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: "${product.imageUrl}",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child: Container(
                width: 10,
                height: 10,
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  strokeWidth: 1,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            imageBuilder: (context, imageProvider) => Container(
              width: 125,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${product.name}",
                  style: primartyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                      overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  NumberFormat.currency(
                          locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                      .format(product.price),
                  style: priceTextStyle.copyWith(fontWeight: medium),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Jumlah : ${cart.qty}",
                      style: primartyTextStyle.copyWith(fontWeight: medium),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                    ),
                  ],
                )
                // Text(
                //   NumberFormat.currency(
                //           locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                //       .format(filterProduct.price),
                //   style:
                //       priceTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

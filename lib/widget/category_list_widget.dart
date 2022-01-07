import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mie_ayu_rawalumbu/models/product_model.dart';
import 'package:mie_ayu_rawalumbu/pages/detail_page.dart';
import 'package:mie_ayu_rawalumbu/provider/product_provider.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:provider/provider.dart';

class CategoryListWidget extends StatelessWidget {
  ProductModel filterProduct;
  CategoryListWidget({Key? key, required this.filterProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${filterProduct.name}",
                  style: primartyTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                Text(
                  "${filterProduct.description}",
                  maxLines: 2,
                  style: thirdTextStyle.copyWith(
                      overflow: TextOverflow.ellipsis, fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                          .format(filterProduct.price),
                      style: priceTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                    ),
                    Image.asset(
                      "assets/wishlist.png",
                      width: 16,
                    )
                  ],
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => DetailPage());
            },
            child: CachedNetworkImage(
              imageUrl: "${filterProduct.imageUrl}",
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
          )
        ],
      ),
    );
  }
}

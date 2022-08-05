import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mie_ayu_rawalumbu/models/product_model.dart';
import 'package:mie_ayu_rawalumbu/provider/product_provider.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CategoryListWidget extends StatelessWidget {
  ProductModel filterProduct;
  CategoryListWidget({Key? key, required this.filterProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return GestureDetector(
      onTap: () {
        Get.toNamed("/detail-page",
            arguments: productProvider.getDetailId(filterProduct));
      },
      child: Container(
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
                  Text(
                    NumberFormat.currency(
                            locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                        .format(filterProduct.price),
                    style: priceTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                ],
              ),
            ),
            CachedNetworkImage(
              imageUrl: "${filterProduct.imageUrl}",
              placeholder: (context, string) => Container(
                height: 100,
                color: Colors.grey.shade300,
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
            )
          ],
        ),
      ),
    );
  }
}

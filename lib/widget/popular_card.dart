import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mie_ayu_rawalumbu/models/product_model.dart';
import 'package:mie_ayu_rawalumbu/provider/product_provider.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PopularCard extends StatelessWidget {
  ProductModel product;

  PopularCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed("/detail-page",
                  arguments: productProvider.getDetailId(product));
            },
            child: CachedNetworkImage(
              imageUrl: "${product.imageUrl}",
              placeholder: (context, string) => Container(
                width: 140,
                height: 100,
                color: Colors.grey.shade300,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Container(
                width: 140,
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
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "${product.name}",
            style: primartyTextStyle.copyWith(
                overflow: TextOverflow.ellipsis,
                fontWeight: semiBold,
                fontSize: 12),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                NumberFormat.currency(
                        locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                    .format(product.price),
                style: priceTextStyle.copyWith(fontWeight: medium),
              ),
              Image.asset(
                "assets/shape.png",
                width: 12,
              ),
            ],
          )
        ],
      ),
    );
  }
}

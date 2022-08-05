import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mie_ayu_rawalumbu/models/favourite_model.dart';
import 'package:mie_ayu_rawalumbu/models/product_model.dart';
import 'package:mie_ayu_rawalumbu/provider/favourite_provider.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class WishlistCard extends StatelessWidget {
  FavouriteModel favouriteModel;
  WishlistCard({Key? key, required this.favouriteModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavouriteProvider favouriteProvider =
        Provider.of<FavouriteProvider>(context);
    ProductModel product = favouriteModel.productModel!;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                      fontSize: 16, fontWeight: medium),
                ),
                Text(
                  "${product.description}",
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
                          .format(product.price),
                      style: priceTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                    ),
                    GestureDetector(
                      onTap: () {
                        favouriteProvider.addFavourite(product);
                      },
                      child: Image.asset(
                        "assets/shape.png",
                        color: backgroundColor2,
                        width: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

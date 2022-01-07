import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/models/product_model.dart';
import 'package:mie_ayu_rawalumbu/pages/CategoryPage/detail_category_page.dart';
import 'package:mie_ayu_rawalumbu/provider/product_provider.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  ProductModel productModel;
  CategoryCard({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return GestureDetector(
      onTap: () async {
        var filterItem = await productProvider.filterProducts(productModel.category);
        Get.toNamed("/detail-category-page", arguments: [filterItem, productModel]);
      },
      child: Container(
        width: 100,
        height: 130,
        margin: EdgeInsets.only(right: 10, top: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: "${productModel.imageCategory}",
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
                width: 100,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "${productModel.category}",
              style: secondaryTextStyle.copyWith(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 14,
                  fontWeight: medium),
            ),
          ],
        ),
      ),
    );
  }
}

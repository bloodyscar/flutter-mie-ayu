import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/models/category_model.dart';
import 'package:mie_ayu_rawalumbu/models/product_model.dart';
import 'package:mie_ayu_rawalumbu/provider/product_provider.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  CategoryModel categoryModel;
  ProductModel productModel;
  CategoryCard({
    Key? key,
    required this.categoryModel,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return GestureDetector(
      onTap: () async {
        var filterItem =
            await productProvider.filterProducts(categoryModel.name);
        Get.toNamed("/detail-category-page",
            arguments: [filterItem, categoryModel]);
      },
      child: Container(
        width: 100,
        height: 130,
        margin: EdgeInsets.only(right: 10, top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: "${categoryModel.imageCategory}",
              placeholder: (context, string) => Container(
                height: 90,
                color: Colors.grey.shade300,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Container(
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
              "${categoryModel.name}",
              style: secondaryTextStyle.copyWith(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12,
                  fontWeight: medium),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/models/category_model.dart';
import 'package:mie_ayu_rawalumbu/models/product_model.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:mie_ayu_rawalumbu/widget/category_list_widget.dart';

class DetailCategoryPage extends StatelessWidget {
  const DetailCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductModel> filterProduct = Get.arguments[0];
    CategoryModel category = Get.arguments[1];
    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Category: ${category.name}"),
        backgroundColor: backgroundColor1,
        elevation: 1,
      ),
      body: Center(
        child: ListView(
          children: filterProduct
              .map(
                (item) => CategoryListWidget(
                  filterProduct: item,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/provider/product_provider.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:mie_ayu_rawalumbu/widget/category_list_widget.dart';
import 'package:mie_ayu_rawalumbu/widget/popular_card.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Category: Mie"),
        backgroundColor: backgroundColor1,
        elevation: 1,
      ),
      body: Center(
        child: ListView(
          children: [
            CategoryListWidget(),
            CategoryListWidget(),
            CategoryListWidget(),
          ],
        ),
      ),
    );
  }
}

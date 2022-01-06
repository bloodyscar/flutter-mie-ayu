import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/pages/detail_page.dart';
import 'package:mie_ayu_rawalumbu/provider/product_provider.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:provider/provider.dart';

class CategoryListWidget extends StatefulWidget {
  CategoryListWidget({Key? key}) : super(key: key);

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
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
                  "Mie Goreng Spesial",
                  style: primartyTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                Text(
                  "Mie goreng spesial dengan isian sayuran, telur, ayam dan bakso sapi, ditambah dengan telur dadar / ceplok",
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
                      "Rp 25,000",
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
            child: ClipRRect(
              child: Image.asset(
                "assets/img-mie.png",
                width: 125,
              ),
            ),
          )
        ],
      ),
    );
  }
}

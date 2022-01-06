import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/pages/detail_page.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => DetailPage());
            },
            child: Container(
              width: 140,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage("assets/img-mie.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Mie Goreng Spesial",
            style: primartyTextStyle.copyWith(
                overflow: TextOverflow.ellipsis, fontWeight: semiBold),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rp 22,000",
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

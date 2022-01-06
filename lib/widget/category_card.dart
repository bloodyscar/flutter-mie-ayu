import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 125,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 100,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: AssetImage("assets/category-bakso.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Text(
            "Bakso",
            style: secondaryTextStyle.copyWith(
                overflow: TextOverflow.ellipsis,
                fontSize: 14,
                fontWeight: medium),
          ),
        ],
      ),
    );
  }
}

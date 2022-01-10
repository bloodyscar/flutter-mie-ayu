import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/map_page.dart';
import 'package:mie_ayu_rawalumbu/pages/CartPage/cart_page.dart';
import 'package:mie_ayu_rawalumbu/provider/cart_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/category_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/google_map_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/product_provider.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:mie_ayu_rawalumbu/widget/category_card.dart';
import 'package:mie_ayu_rawalumbu/widget/popular_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    GoogleMapProvider providerGoogle = Provider.of<GoogleMapProvider>(context);
    ProductProvider providerProduct = Provider.of<ProductProvider>(context);
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    var responsive = MediaQuery.of(context).size;

    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => MapPage());
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Change Location",
                            style: secondaryTextStyle,
                          ),
                          Image.asset(
                            "assets/pin.png",
                            width: 24,
                          ),
                        ],
                      ),
                      Container(
                        width: responsive.width * 0.5,
                        child: (providerGoogle.street == null)
                            ? Text(
                                "Jalan Tidak Ditemukan",
                                style: secondaryTextStyle.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 14,
                                    fontWeight: medium),
                              )
                            : Text(
                                "${providerGoogle.street}",
                                style: secondaryTextStyle.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 12,
                                    fontWeight: medium),
                              ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => CartPage());
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "${cartProvider.getTotalQty()}",
                            style: secondaryTextStyle.copyWith(fontSize: 10),
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/cart.png"),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container()
          ],
        ),
      );
    }

    Widget searchingBox() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: TextField(
          onTap: () {},
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.mic_none),
            hintText: "Cari makan apa ya...",
            filled: true,
            fillColor: Color(0xffF3F4F6),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffF3F4F6),
              ),
            ),
          ),
        ),
      );
    }

    Widget categoriesSection() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category",
                  style: secondaryTextStyle.copyWith(
                      fontSize: 18, fontWeight: medium),
                ),
                Text(
                  "See All",
                  style: secondaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: medium),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 120,
                  mainAxisExtent: 130,
                ),
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    categoryModel: categoryProvider.categories[index],
                    productModel: providerProduct.products[index],
                  );
                }),
          )
        ],
      );
    }

    Widget contentPopular() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Food",
                    style: priceTextStyle.copyWith(
                        fontSize: 18, fontWeight: medium),
                  ),
                  Text(
                    "See All",
                    style: priceTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "We choose the best food for you",
                style: primartyTextStyle.copyWith(fontSize: 12),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    children: providerProduct.products
                        .map((product) => PopularCard(
                              product: product,
                            ))
                        .toList()),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: responsive.height * 0.5,
            decoration: BoxDecoration(
              color: backgroundColor1,
            ),
          ),
          Container(
            width: double.infinity,
            height: responsive.height * 0.5,
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(48),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: responsive.height * 0.5),
            decoration: BoxDecoration(
              color: backgroundColor2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: responsive.height * 0.5),
            decoration: BoxDecoration(
              color: backgroundColor1,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(48),
              ),
            ),
          ),
          ListView(
            children: [
              header(),
              searchingBox(),
              categoriesSection(),
              contentPopular(),
            ],
          ),
        ],
      ),
    );
  }
}

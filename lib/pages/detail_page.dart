import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mie_ayu_rawalumbu/provider/cart_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/favourite_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/product_provider.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    FavouriteProvider favouriteProvider =
        Provider.of<FavouriteProvider>(context);

    Widget header() {
      return Stack(
        children: [
          CachedNetworkImage(
            imageUrl: "${productProvider.getDetailProduct!.imageUrl}",
            placeholder: (context, string) => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.grey.shade300,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            imageBuilder: (context, imageProvider) => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ),
          ),
          SafeArea(
            child: Container(
              margin:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 5),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset(
                        "assets/back.png",
                        color: backgroundColor1,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      favouriteProvider
                          .addFavourite(productProvider.getDetailProduct!);
                      if (favouriteProvider
                          .isFav(productProvider.getDetailProduct!)) {
                        Get.snackbar(
                          "Favourite",
                          "Favourite Has been added",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.blue,
                          duration: Duration(milliseconds: 1000),
                        );
                      } else {
                        Get.snackbar(
                          "Favourite",
                          "Favourite Has been remove",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          duration: Duration(milliseconds: 1000),
                        );
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 5),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: favouriteProvider
                              .isFav(productProvider.getDetailProduct!)
                          ? Image.asset(
                              "assets/shape.png",
                              color: backgroundColor2,
                            )
                          : Image.asset(
                              "assets/wishlist.png",
                              color: backgroundColor2,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        transform: Matrix4.translationValues(0.0, -23.0, 0.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32)),
            color: backgroundColor1),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding:
              EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
                topLeft: Radius.circular(24),
              ),
              color: backgroundColor1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${productProvider.getDetailProduct!.name}",
                style:
                    primartyTextStyle.copyWith(fontSize: 18, fontWeight: bold),
              ),
              Text(
                "${productProvider.getDetailProduct!.category}  •  Gratis Ongkir",
                style: TextStyle(color: Color(0xffA1A1A1), fontSize: 12),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: boxDescriptionColor),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Keterangan",
                        style: primartyTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${productProvider.getDetailProduct!.description}",
                        style: thirdTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: boxDescriptionColor),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Harga",
                        style: primartyTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                      Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(productProvider.getDetailProduct!.price),
                        style: priceTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: defaultMargin,
              ),
              GestureDetector(
                onTap: () async {
                  await cartProvider.addCart(productProvider.getDetailProduct!);
                  showModalBottomSheet(
                    backgroundColor: boxDescriptionColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    context: context,
                    builder: (context) => Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      width: double.infinity,
                      height: 200,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Berhasil Menambahkan Produk",
                                style: primartyTextStyle,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: 130,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: backgroundColor2,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.offAndToNamed("/cart-page");
                                  },
                                  child: Center(
                                    child: Text(
                                      "Lihat Keranjang",
                                      style: secondaryTextStyle.copyWith(
                                          fontSize: 12, fontWeight: semiBold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: backgroundColor2),
                  child: Center(
                      child: Text(
                    "Add to Cart",
                    style: TextStyle(fontSize: 16, fontWeight: semiBold),
                  )),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor1,
        body: Column(
          children: [
            header(),
            content(),
          ],
        ));
  }
}

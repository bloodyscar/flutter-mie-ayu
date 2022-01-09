import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mie_ayu_rawalumbu/provider/cart_provider.dart';
import 'package:mie_ayu_rawalumbu/provider/product_provider.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Widget header() {
      return Stack(
        children: [
          CachedNetworkImage(
            imageUrl: "${productProvider.getDetailProduct!.imageUrl}",
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
                  Container(
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
                      "assets/shape.png",
                      color: backgroundColor2,
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
                onTap: (){
                  cartProvider.addCart(productProvider.getDetailProduct!);
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

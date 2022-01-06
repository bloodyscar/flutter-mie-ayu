import 'package:flutter/material.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img-mie.png"),
                    fit: BoxFit.cover)),
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
                    child: Image.asset(
                      "assets/back.png",
                      width: 10,
                    ),
                  ),
                  Image.asset(
                    "assets/shape.png",
                    width: 20,
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
                "Bakmie Goreng Spesial",
                style:
                    primartyTextStyle.copyWith(fontSize: 20, fontWeight: bold),
              ),
              Text(
                "Mie  •  Gratis Ongkir",
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
                        "Deskripsi",
                        style: primartyTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Mie goreng spesial dengan isian sayuran, telur, ayam dan bakso sapi, ditambah dengan telur dadar / ceplok",
                        style: thirdTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Harga",
                        style: primartyTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                      Text(
                        "Rp 25,000",
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
              Container(
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

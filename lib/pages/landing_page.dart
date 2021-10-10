import 'package:flutter/material.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        height: 130,
        decoration: BoxDecoration(
            color: backgroundColor2,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24))),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hello, Adit",
                      style: secondaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    Container(
                      width: 25,
                      height: 16,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/hambuger-menu.png"))),
                    )
                  ],
                ),
                Text(
                  "There’s anything you need?",
                  style: secondaryTextStyle.copyWith(
                      fontWeight: light, fontSize: 12),
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget category() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail-page');
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose Category",
                style: primartyTextStyle.copyWith(
                    fontSize: 20, fontWeight: semiBold),
              ),
              SizedBox(
                height: 10,
              ),
              // Baris ke 1
              Row(
                children: [
                  // Category 1
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: 155,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              image: DecorationImage(
                                  image: AssetImage("assets/nasigoreng.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Nasi Goreng",
                          style: primartyTextStyle.copyWith(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  // Category 2
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: 155,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              image: DecorationImage(
                                  image: AssetImage("assets/miegoreng.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Bakmie Ayam",
                          style: primartyTextStyle.copyWith(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // Baris ke 2
              Row(
                children: [
                  // Category 1
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: 155,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              image: DecorationImage(
                                  image: AssetImage("assets/capcay.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Capcay Kuah",
                          style: primartyTextStyle.copyWith(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  // Category 2
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: 155,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              image: DecorationImage(
                                  image: AssetImage("assets/kwetiaw.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Kwetiaw Goreng",
                          style: primartyTextStyle.copyWith(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget bestForYou() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Best For You",
              style: primartyTextStyle.copyWith(
                  fontSize: 20, fontWeight: semiBold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  // PRODUK 1
                  Container(
                    width: 125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset("assets/capcay.jpg"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Capycay Kuah",
                          style: primartyTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rp 18.000",
                              style: priceTextStyle.copyWith(
                                  fontSize: 12, fontWeight: semiBold),
                            ),
                            Image.asset(
                              "assets/shape.png",
                              width: 12,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  // PRODUK 2
                  Container(
                    width: 125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset("assets/kwetiaw.jpg"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Kwetiwaw Goreng",
                          style: primartyTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rp 18.000",
                              style: priceTextStyle.copyWith(
                                  fontSize: 12, fontWeight: semiBold),
                            ),
                            Image.asset(
                              "assets/wishlist.png",
                              width: 12,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  // PRODUK 3
                  Container(
                    width: 125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset("assets/miegoreng.jpg"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Bakmie Goreng",
                          style: primartyTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rp 18.000",
                              style: priceTextStyle.copyWith(
                                  fontSize: 12, fontWeight: semiBold),
                            ),
                            Image.asset(
                              "assets/wishlist.png",
                              width: 12,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  // PRODUK 4
                  Container(
                    width: 125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset("assets/nasigoreng.jpg"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Nasi Goreng",
                          style: primartyTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rp 18.000",
                              style: priceTextStyle.copyWith(
                                  fontSize: 12, fontWeight: semiBold),
                            ),
                            Image.asset(
                              "assets/wishlist.png",
                              width: 12,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          )
        ],
      );
    }

    Widget categoryMie() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Category : Mie Goreng",
              style: primartyTextStyle.copyWith(
                  fontSize: 20, fontWeight: semiBold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  // PRODUK 1
                  Container(
                    width: 125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset("assets/miegoreng.jpg"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Bakmie Goreng",
                          style: primartyTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rp 18.000",
                              style: priceTextStyle.copyWith(
                                  fontSize: 12, fontWeight: semiBold),
                            ),
                            Image.asset(
                              "assets/shape.png",
                              width: 12,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  // PRODUK 2
                  Container(
                    width: 125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset("assets/miegoreng.jpg"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Bakmie Goreng",
                          style: primartyTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rp 18.000",
                              style: priceTextStyle.copyWith(
                                  fontSize: 12, fontWeight: semiBold),
                            ),
                            Image.asset(
                              "assets/wishlist.png",
                              width: 12,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  // PRODUK 3
                  Container(
                    width: 125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset("assets/miegoreng.jpg"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Bakmie Goreng",
                          style: primartyTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rp 18.000",
                              style: priceTextStyle.copyWith(
                                  fontSize: 12, fontWeight: semiBold),
                            ),
                            Image.asset(
                              "assets/wishlist.png",
                              width: 12,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  // PRODUK 4
                  Container(
                    width: 125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset("assets/nasigoreng.jpg"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Nasi Goreng",
                          style: primartyTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rp 18.000",
                              style: priceTextStyle.copyWith(
                                  fontSize: 12, fontWeight: semiBold),
                            ),
                            Image.asset(
                              "assets/wishlist.png",
                              width: 12,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          )
        ],
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor1,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              SizedBox(
                height: defaultMargin,
              ),
              category(),
              SizedBox(
                height: defaultMargin,
              ),
              bestForYou(),
              SizedBox(
                height: defaultMargin,
              ),
              categoryMie(),
              SizedBox(
                height: defaultMargin,
              ),
            ],
          ),
        ));
  }
}

// body: ListView(
//   children: [
//     header(),
//     SizedBox(
//       height: defaultMargin,
//     ),
//     category(),
//     SizedBox(
//       height: defaultMargin,
//     ),
//     bestForYou()
//   ],
// ),

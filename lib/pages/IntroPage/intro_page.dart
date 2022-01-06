import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/pages/login_page.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:mie_ayu_rawalumbu/widget/button.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<String> imgList = [
    "assets/intro-1.png",
    "assets/intro-2.png",
    "assets/intro-3.png",
  ];
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSlider = [
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/intro-1.png"), fit: BoxFit.cover),
        ),
      ),
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/intro-2.png"), fit: BoxFit.cover),
        ),
      ),
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/intro-3.png"), fit: BoxFit.cover),
        ),
      ),
    ];

    Widget content() {
      return Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                items: imageSlider,
                carouselController: _controller,
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                  aspectRatio: 9 / 16,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.55),
                child: Column(
                  children: [
                    Text(
                      "Kemudahan dalam pemesanan makanan",
                      style: secondaryTextStyle.copyWith(
                          fontSize: 20, fontWeight: bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Bebas pusing urusan pesan makanan dengan memesan secara online",
                        style: secondaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: _current == entry.key ? 24 : 8,
                            height: 8,
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.black.withOpacity(
                                    _current == entry.key ? 0.8 : 0.5)),
                          ),
                        );
                      }).toList(),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.to(LoginPage());
                            },
                            child: Text("LOGIN"),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Button(
                              title: "Register",
                              width: 146,
                              height: 50,
                              bgColor: Colors.black,
                              textColor: Colors.white,
                              textSize: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          content(),
        ],
      ),
    );
  }
}

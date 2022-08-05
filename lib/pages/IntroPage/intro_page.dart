import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/pages/AuthPage/registration_page.dart';
import 'package:mie_ayu_rawalumbu/pages/login_page.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:permission_handler/permission_handler.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<String> imgList = [
    "https://res.cloudinary.com/adithrw/image/upload/v1642079797/intro-1_yungfx.png",
    "https://res.cloudinary.com/adithrw/image/upload/v1642079932/intro-2_edrlpy.png",
    "https://res.cloudinary.com/adithrw/image/upload/v1642079943/intro-3_dlcyhl.png",
  ];

  @override
  void initState() {
    super.initState();
    Permission.location.request();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSlider = [
      CachedNetworkImage(
        imageUrl:
            "https://res.cloudinary.com/adithrw/image/upload/v1642079797/intro-1_yungfx.png",
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
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
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
      ),
      CachedNetworkImage(
        imageUrl:
            "https://res.cloudinary.com/adithrw/image/upload/v1642079932/intro-2_edrlpy.png",
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
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
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
      ),
      CachedNetworkImage(
        imageUrl:
            "https://res.cloudinary.com/adithrw/image/upload/v1642079943/intro-3_dlcyhl.png",
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
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
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
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
                      margin: EdgeInsets.symmetric(vertical: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.to(LoginPage());
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              fixedSize: const Size(120, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Login",
                              style: primartyTextStyle.copyWith(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.to(RegistrationPage());
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              fixedSize: const Size(120, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Register",
                              style: primartyTextStyle.copyWith(fontSize: 16),
                            ),
                          ),
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
      body: FutureBuilder(builder: (context, snapshot) {
        return Stack(
          children: [
            content(),
          ],
        );
      }),
    );
  }
}

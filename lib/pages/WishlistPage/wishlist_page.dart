import 'package:flutter/material.dart';

import 'package:mie_ayu_rawalumbu/models/favourite_model.dart';
import 'package:mie_ayu_rawalumbu/pages/WishlistPage/wishlist_card.dart';
import 'package:mie_ayu_rawalumbu/provider/favourite_provider.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavouriteProvider favouriteProvider =
        Provider.of<FavouriteProvider>(context);
    List<FavouriteModel> favourite = favouriteProvider.favouriteModel;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor2,
        title: Center(
          child: Text(
            "Favourite",
            textAlign: TextAlign.center,
            style: secondaryTextStyle.copyWith(fontSize: 16),
          ),
        ),
      ),
      body: favouriteProvider.favouriteModel.length > 0
          ? ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: favourite
                        .map(
                          (item) => WishlistCard(
                            favouriteModel: item,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.8,
                    height: height * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/empty-cart.png"),
                      ),
                    ),
                  ),
                  Text(
                    "Favourite anda masih kosong",
                    style: primartyTextStyle.copyWith(
                        fontSize: 20, fontWeight: medium),
                  ),
                ],
              ),
            ),
    );
  }
}

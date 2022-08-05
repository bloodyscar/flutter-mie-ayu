import 'package:flutter/cupertino.dart';
import 'package:mie_ayu_rawalumbu/models/favourite_model.dart';
import 'package:mie_ayu_rawalumbu/models/product_model.dart';

class FavouriteProvider with ChangeNotifier {
  List<FavouriteModel> _favouriteModel = [];

  List<FavouriteModel> get favouriteModel => _favouriteModel;
  set favouriteModel(List<FavouriteModel> favouriteModels) {
    _favouriteModel = favouriteModels;
    notifyListeners();
  }

  removeFav(ProductModel productModel) {
    _favouriteModel.removeWhere(
        (element) => element.productModel!.name == productModel.name);
    notifyListeners();
  }

  addFavourite(ProductModel productModel) {
    if (!isFav(productModel)) {
      _favouriteModel.add(FavouriteModel(
          id: _favouriteModel.length,
          isFavourite: true,
          productModel: productModel));
    } else {
      _favouriteModel.removeWhere(
          (element) => element.productModel!.name == productModel.name);
    }
    notifyListeners();
  }

  bool isFav(ProductModel productModel) {
    if (_favouriteModel.indexWhere(
            (element) => element.productModel!.name == productModel.name) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}

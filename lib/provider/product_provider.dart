import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductProvider extends ChangeNotifier {
  bool isFavourite = false;

  void isFavouriteChecked(bool newValue) {
    isFavourite = newValue;
    Get.snackbar("Berhasil", "Berhasil menambahkan ke Cart");

    notifyListeners();
  }
}

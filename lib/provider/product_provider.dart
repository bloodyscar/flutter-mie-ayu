import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/models/product_model.dart';
import 'package:mie_ayu_rawalumbu/service/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;
  set products(List<ProductModel> products) {
    _products = products;

    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      var listProduct = await ProductService().getAllProducts();
      products = listProduct;
    } catch (e) {
      print(e);
    }
  }
}

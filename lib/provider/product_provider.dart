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

  Future<List<ProductModel>> getProducts() async {
    try {
      var listProduct = await ProductService().getAllProducts();
      products = listProduct;
      return products;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ProductModel>> filterProducts(String? categoryName) async {
    try {
      var listProduct = await ProductService().getAllProducts();
      var filterCategory = listProduct
          .where((element) => element.category!.contains(categoryName!))
          .toList();
      return filterCategory;
    } catch (e) {
      throw Exception(e);
    }
  }
}

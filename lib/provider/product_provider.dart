import 'package:flutter/cupertino.dart';
import 'package:mie_ayu_rawalumbu/models/product_model.dart';
import 'package:mie_ayu_rawalumbu/service/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  ProductModel? _getDetailProduct;

  // PRODUCT
  List<ProductModel> get products => _products;
  set products(List<ProductModel> products) {
    _products = products;

    notifyListeners();
  }

  ProductModel? get getDetailProduct => _getDetailProduct;
  set getDetailProduct(ProductModel? getIdProduct) {
    _getDetailProduct = getIdProduct;
    notifyListeners();
  }



  Future<ProductModel> getDetailId(ProductModel idProduct) async {
    return getDetailProduct = idProduct;
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

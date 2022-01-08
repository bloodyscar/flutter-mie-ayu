import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/models/category_model.dart';
import 'package:mie_ayu_rawalumbu/models/product_model.dart';
import 'package:mie_ayu_rawalumbu/service/category_service.dart';
import 'package:mie_ayu_rawalumbu/service/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  ProductModel? _getDetailProduct;
  List<ProductModel> _cart = [];

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

  // CART
  List<ProductModel> get carts => _cart;
  set carts(List<ProductModel> carts) {
    _cart = carts;
    notifyListeners();
  }

  Future<List<ProductModel>> addToCart(ProductModel newListCart) async {
    try {
      _cart.add(newListCart);
      print(_cart.length);

      return _cart;
    } catch (e) {
      throw Exception(e);
    }
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

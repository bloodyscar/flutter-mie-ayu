import 'package:flutter/cupertino.dart';
import 'package:mie_ayu_rawalumbu/models/cart_model.dart';
import 'package:mie_ayu_rawalumbu/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  // CART
  List<CartModel> get carts => _carts;
  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(ProductModel newListCart) {
    if (productExist(newListCart)) {
      int index = _carts.indexWhere(
          (element) => element.productModel!.name == newListCart.name);
      _carts[index].qty++;
      print(_carts[index].qty);
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          productModel: newListCart,
          qty: 1,
        ),
      );
      print(carts);
    }
    notifyListeners();
  }

  productExist(ProductModel newListCart) {
    if (_carts.indexWhere(
            (element) => element.productModel!.name == newListCart.name) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}

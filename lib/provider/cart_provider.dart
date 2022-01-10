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

  totalPrice() {
    var total = 0;
    for (var item in _carts) {
      total += (item.qty * item.productModel!.price!);
    }
    return total;
  }

  removeCart(ProductModel? newListCart) {
    int index = _carts.indexWhere(
        (element) => element.productModel!.name == newListCart!.name);
    _carts.removeAt(index);
    notifyListeners();
  }

  addCart(ProductModel newListCart) {
    if (productExist(newListCart)) {
      int index = _carts.indexWhere(
          (element) => element.productModel!.name == newListCart.name);
      _carts[index].qty++;
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          productModel: newListCart,
          qty: 1,
        ),
      );
    }
    notifyListeners();
  }

  increaseQty(ProductModel? newListCart) {
    int index = _carts.indexWhere(
        (element) => element.productModel!.name == newListCart!.name);
    _carts[index].qty++;
    notifyListeners();
  }

  decreaseQty(ProductModel? newListCart) {
    int index = _carts.indexWhere(
        (element) => element.productModel!.name == newListCart!.name);
    if (_carts[index].qty > 1) {
      _carts[index].qty--;
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

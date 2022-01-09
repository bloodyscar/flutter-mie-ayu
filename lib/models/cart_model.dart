import 'package:mie_ayu_rawalumbu/models/product_model.dart';

class CartModel{
  int? id;
  ProductModel? productModel;
  int qty = 0;

  CartModel({required this.id, required this.productModel, required this.qty});

  CartModel.fromJson(Map<String, dynamic> json){
    id = json["id"];
    productModel = json["productModel"];
    qty = json["qty"];
  }

}
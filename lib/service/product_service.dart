import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mie_ayu_rawalumbu/models/product_model.dart';

class ProductService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> getAllProducts() {
    try {
      return firestore.collection("products").get().then((value) {
        List<ProductModel> listProducts = [];
        for (var i = 0; i < value.docs.length; i++) {
          var items = value.docs[i].data() as Map<String, dynamic>;
          listProducts.add(ProductModel.fromJson(items));
        }
        return listProducts;
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}

import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mie_ayu_rawalumbu/models/product_model.dart';

class ProductService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getProducts() {
    CollectionReference products = firestore.collection("products");
    return products.get();
  }
}

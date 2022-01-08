import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mie_ayu_rawalumbu/models/category_model.dart';

class CategoryService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategory() {
    try {
      return firestore.collection("category").get().then((value) {
        List<CategoryModel> listCategory = [];
        for (var i = 0; i < value.docs.length; i++) {
          var items = value.docs[i].data() as Map<String, dynamic>;
          listCategory.add(CategoryModel.fromJson(items));
        }
        return listCategory;
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}

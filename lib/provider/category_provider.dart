import 'package:flutter/cupertino.dart';
import 'package:mie_ayu_rawalumbu/models/category_model.dart';
import 'package:mie_ayu_rawalumbu/service/category_service.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _categories = [];

  // CATEGORY
  List<CategoryModel> get categories => _categories;
  set categories(List<CategoryModel> categories) {
    _categories = categories;

    notifyListeners();
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      var getCategory = await CategoryService().getCategory();
      categories = getCategory;
      return categories;
    } catch (e) {
      throw Exception(e);
    }
  }
}

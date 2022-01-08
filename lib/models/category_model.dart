class CategoryModel {
  String? name, imageCategory;

  CategoryModel({this.name, this.imageCategory});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    imageCategory = json["imageCategory"];
  }
}

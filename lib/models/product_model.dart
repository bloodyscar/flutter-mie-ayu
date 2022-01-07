class ProductModel {
  String? name;
  String? category;
  String? description;
  String? imageUrl;
  String? imageCategory;
  int? price;

  ProductModel(
      {this.name,
      this.category,
      this.description,
      this.imageUrl,
      this.imageCategory,
      this.price});

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    category = json["category"];
    description = json["description"];
    imageUrl = json["imageUrl"];
    imageCategory = json["imageCategory"];
    price = json["price"];
  }
}

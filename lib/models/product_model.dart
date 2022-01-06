class ProductModel{
  String? name;
  String? category;
  String? description;
  String? imageUrl;
  int? price;

  ProductModel({this.name, this.category, this.description, this.imageUrl, this.price});

  ProductModel.fromJson(Map<String, dynamic> json){
    name = json["name"];
    category = json["category"];
    description = json["description"];
    imageUrl = json["imageUrl"];
    price = json["price"];
  }
}
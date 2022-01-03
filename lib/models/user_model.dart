class UserModel {
  String? email;
  String? password;

  UserModel({this.email, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    password = json["password"];
  }
}

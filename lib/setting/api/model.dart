class ShopLoginModel {
  late bool status;
  late String message;
  late UserData data;
  ShopLoginModel.fromJson(Map<String, dynamic> json) {
    // data come json map data
    // بستخرج الداتا واحط كل واحد في مكانه
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null ? UserData.fromJson(json['data']) : null)!;
  }
}

class UserData {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late int point;
  late int credit;
  late String token;
  UserData(
      {required this.token,
      required this.email,
      required this.image,
      required this.point,
      required this.credit,
      required this.phone,
      required this.name,
      required this.id});
  // named constructor
  UserData.fromJson(Map<String, dynamic> json) {
    // data come json map data
    // بستخرج الداتا واحط كل واحد في مكانه
    id = json['id'];
    email = json['email']; //بحول من json ل dart
    name = json['name'];
    phone = json['phone'];
    image = json['image'];
    point = json['point'];
    token = json['token'];
    credit = json['credit'];
  }
}

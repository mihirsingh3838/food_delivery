class UserModel {
  UserModel(
      {required this.id,
      required this.email,
      required this.name,
      required this.orderCount,
      required this.phone});
  int id;
  String name;
  String email;
  String phone;
  int orderCount;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['f_name'],
      orderCount: json['order_count'],
      phone: json['phone'],
    );
  }
}

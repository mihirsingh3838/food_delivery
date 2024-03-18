class SignUpBody {
  SignUpBody({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });
  String name;
  String phone;
  String email;
  String password;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["f_name"] = name;
    data["phone"] = phone;
    data["email"] = email;
    data["password"] = password;
    return data;
  }
}

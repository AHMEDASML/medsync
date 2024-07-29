import 'dart:convert';

class LoginModel {
  String token;
  String firstName;
  String lastName;
  String email;
  int phone;
  int age;
  String gender;

  LoginModel({
    required this.token,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.age,
    required this.gender,
  });

  factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    token: json["token"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phone: json["phone"],
    age: json["age"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "age": age,
    "gender": gender,
  };
}

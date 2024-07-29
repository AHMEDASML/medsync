// To parse this JSON data, do
//
//     final createUsersModel = createUsersModelFromJson(jsonString);

import 'dart:convert';

class CreateUsersModel {
  Data data;

  CreateUsersModel({
    required this.data,
  });

  factory CreateUsersModel.fromRawJson(String str) => CreateUsersModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateUsersModel.fromJson(Map<String, dynamic> json) => CreateUsersModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  String id;
  String firstName;
  String lastName;
  String email;
  int phone;

  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
  };
}

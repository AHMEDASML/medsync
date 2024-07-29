import 'dart:convert';

class ProfileModel {
  Data data;

  ProfileModel({
    required this.data,
  });

  factory ProfileModel.fromRawJson(String str) => ProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  String firstName;
  String lastName;
  String email;
  int phone;
  String medicalHistory;
  String allergies;
  String currentMedications;
  int age;
  String gender;
  int v;

  Data({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.medicalHistory,
    required this.allergies,
    required this.currentMedications,
    required this.age,
    required this.gender,
    required this.v,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phone: json["phone"],
    medicalHistory: json["medical_history"],
    allergies: json["allergies"],
    currentMedications: json["current_medications"],
    age: json["age"],
    gender: json["gender"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "medical_history": medicalHistory,
    "allergies": allergies,
    "current_medications": currentMedications,
    "age": age,
    "gender": gender,
    "__v": v,
  };
}

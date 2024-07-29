import 'dart:convert';

class NextNumberDrModel {
  int nextNumber;
  Specialization specialization;
  String name;
  int currentNumber;

  NextNumberDrModel({
    required this.nextNumber,
    required this.specialization,
    required this.name,
    required this.currentNumber,
  });

  factory NextNumberDrModel.fromRawJson(String str) => NextNumberDrModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NextNumberDrModel.fromJson(Map<String, dynamic> json) => NextNumberDrModel(
    nextNumber: json["nextNumber"],
    specialization: Specialization.fromJson(json["specialization"]),
    name: json["name"],
    currentNumber: json["currentNumber"],
  );

  Map<String, dynamic> toJson() => {
    "nextNumber": nextNumber,
    "specialization": specialization.toJson(),
    "name": name,
    "currentNumber": currentNumber,
  };
}

class Specialization {
  String id;
  String name;

  Specialization({
    required this.id,
    required this.name,
  });

  factory Specialization.fromRawJson(String str) => Specialization.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Specialization.fromJson(Map<String, dynamic> json) => Specialization(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}

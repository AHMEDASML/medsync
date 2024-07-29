import 'dart:convert';

class StatesModel {
  String id;
  String name;

  StatesModel({
    required this.id,
    required this.name,
  });

  factory StatesModel.fromRawJson(String str) => StatesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StatesModel.fromJson(Map<String, dynamic> json) => StatesModel(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}

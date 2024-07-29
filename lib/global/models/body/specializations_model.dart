import 'dart:convert';

class SpecializationsModel {
  String id;
  String name;
  int ourId;
  String nameFrance;
  String nameArabic;
  bool icon;

  SpecializationsModel({
    required this.id,
    required this.name,
    required this.ourId,
    required this.nameFrance,
    required this.nameArabic,
    required this.icon,
  });

  factory SpecializationsModel.fromRawJson(String str) => SpecializationsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SpecializationsModel.fromJson(Map<String, dynamic> json) => SpecializationsModel(
    id: json["_id"],
    name: json["name"],
    ourId: json["ourId"],
    nameFrance: json["nameFrance"],
    nameArabic: json["nameArabic"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "ourId": ourId,
    "nameFrance": nameFrance,
    "nameArabic": nameArabic,
    "icon": icon,
  };
}

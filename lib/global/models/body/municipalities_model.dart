import 'dart:convert';

class MunicipalitiesModel {
  List<MunicipalitieModel> data;

  MunicipalitiesModel({
    required this.data,
  });

  factory MunicipalitiesModel.fromRawJson(String str) => MunicipalitiesModel.fromJson(json.decode(str));





  String toRawJson() => json.encode(toJson());

  factory MunicipalitiesModel.fromJson(Map<String, dynamic> json) => MunicipalitiesModel(
    data: List<MunicipalitieModel>.from(json["data"].map((x) => MunicipalitieModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MunicipalitieModel {
  String id;
  String name;
  String state;
  int v;

  MunicipalitieModel({
    required this.id,
    required this.name,
    required this.state,
    required this.v,
  });

  factory MunicipalitieModel.fromRawJson(String str) => MunicipalitieModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MunicipalitieModel.fromJson(Map<String, dynamic> json) => MunicipalitieModel(
    id: json["_id"],
    name: json["name"],
    state: json["state"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "state": state,
    "__v": v,
  };
}

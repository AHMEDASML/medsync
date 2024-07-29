import 'dart:convert';

class LaboratoriesModel {
  Location location;
  String id;
  String name;
  String phone;
  String municipality;
  String state;
  String labName;
  int v;

  LaboratoriesModel({
    required this.location,
    required this.id,
    required this.name,
    required this.phone,
    required this.municipality,
    required this.state,
    required this.labName,
    required this.v,
  });

  factory LaboratoriesModel.fromRawJson(String str) => LaboratoriesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LaboratoriesModel.fromJson(Map<String, dynamic> json) => LaboratoriesModel(
    location: Location.fromJson(json["location"]),
    id: json["_id"],
    name: json["name"],
    phone: json["phone"],
    municipality: json["municipality"],
    state: json["state"],
    labName: json["labName"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "_id": id,
    "name": name,
    "phone": phone,
    "municipality": municipality,
    "state": state,
    "labName": labName,
    "__v": v,
  };
}

class Location {
  double lng;
  double lat;

  Location({
    required this.lng,
    required this.lat,
  });

  factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    lng: json["lng"]?.toDouble(),
    lat: json["lat"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lng": lng,
    "lat": lat,
  };
}

import 'dart:convert';

class FarmasyModel {
  Location location;
  String id;
  String name;
  int phone;
  String municipality;
  String state;
  int? v;

  FarmasyModel({
    required this.location,
    required this.id,
    required this.name,
    required this.phone,
    required this.municipality,
    required this.state,
    this.v,
  });

  factory FarmasyModel.fromRawJson(String str) => FarmasyModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FarmasyModel.fromJson(Map<String, dynamic> json) => FarmasyModel(
    location: Location.fromJson(json["location"]),
    id: json["_id"],
    name: json["name"],
    phone: json["phone"],
    municipality: json["municipality"],
    state: json["state"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "_id": id,
    "name": name,
    "phone": phone,
    "municipality": municipality,
    "state": state,
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

import 'dart:convert';

class SearchPharmaciesModels {
  String brandName;
  List<Pharmacist> pharmacist;

  SearchPharmaciesModels({
    required this.brandName,
    required this.pharmacist,
  });

  factory SearchPharmaciesModels.fromRawJson(String str) => SearchPharmaciesModels.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchPharmaciesModels.fromJson(Map<String, dynamic> json) => SearchPharmaciesModels(
    brandName: json["brand_name"],
    pharmacist: List<Pharmacist>.from(json["pharmacist"].map((x) => Pharmacist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "brand_name": brandName,
    "pharmacist": List<dynamic>.from(pharmacist.map((x) => x.toJson())),
  };
}

class Pharmacist {
  Location location;
  String id;
  String name;

  Pharmacist({
    required this.location,
    required this.id,
    required this.name,
  });

  factory Pharmacist.fromRawJson(String str) => Pharmacist.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pharmacist.fromJson(Map<String, dynamic> json) => Pharmacist(
    location: Location.fromJson(json["location"]),
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "_id": id,
    "name": name,
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

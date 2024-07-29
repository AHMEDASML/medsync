import 'dart:convert';

class ViewAllDoctorsModel {
  Location location;
  String id;
  String name;
  Specialization specialization;
  int maxPatients;
  String phone;
  String municipality;
  String state;
  String bookingStartTime;
  String bookingEndTime;
  int v;
  String bio;
  String clinicName;
  bool isOpen;

  ViewAllDoctorsModel({
    required this.location,
    required this.id,
    required this.name,
    required this.specialization,
    required this.maxPatients,
    required this.phone,
    required this.municipality,
    required this.state,
    required this.bookingStartTime,
    required this.bookingEndTime,
    required this.v,
    required this.bio,
    required this.clinicName,
    required this.isOpen,
  });

  factory ViewAllDoctorsModel.fromRawJson(String str) => ViewAllDoctorsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ViewAllDoctorsModel.fromJson(Map<String, dynamic> json) => ViewAllDoctorsModel(
    location: Location.fromJson(json["location"]),
    id: json["_id"],
    name: json["name"],
    specialization: Specialization.fromJson(json["specialization"]),
    maxPatients: json["maxPatients"],
    phone: json["phone"],
    municipality: json["municipality"],
    state: json["state"],
    bookingStartTime: json["bookingStartTime"],
    bookingEndTime: json["bookingEndTime"],
    v: json["__v"],
    bio: json["bio"],
    clinicName: json["clinicName"],
    isOpen: json["isOpen"],
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "_id": id,
    "name": name,
    "specialization": specialization.toJson(),
    "maxPatients": maxPatients,
    "phone": phone,
    "municipality": municipality,
    "state": state,
    "bookingStartTime": bookingStartTime,
    "bookingEndTime": bookingEndTime,
    "__v": v,
    "bio": bio,
    "clinicName": clinicName,
    "isOpen": isOpen,
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

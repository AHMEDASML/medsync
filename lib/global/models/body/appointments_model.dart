import 'dart:convert';

class AppointmentsModel {
  List<BookingDate> bookingDates;

  AppointmentsModel({
    required this.bookingDates,
  });

  factory AppointmentsModel.fromRawJson(String str) => AppointmentsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AppointmentsModel.fromJson(Map<String, dynamic> json) => AppointmentsModel(
    bookingDates: List<BookingDate>.from(json["bookingDates"].map((x) => BookingDate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bookingDates": List<dynamic>.from(bookingDates.map((x) => x.toJson())),
  };
}

class BookingDate {
  DateTime bookingDate;
  Doctor doctor;

  BookingDate({
    required this.bookingDate,
    required this.doctor,
  });

  factory BookingDate.fromRawJson(String str) => BookingDate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookingDate.fromJson(Map<String, dynamic> json) => BookingDate(
    bookingDate: DateTime.parse(json["bookingDate"]),
    doctor: Doctor.fromJson(json["doctor"]),
  );

  Map<String, dynamic> toJson() => {
    "bookingDate": bookingDate.toIso8601String(),
    "doctor": doctor.toJson(),
  };
}

class Doctor {
  String id;
  String name;
  String specialization;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
  });

  factory Doctor.fromRawJson(String str) => Doctor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["id"],
    name: json["name"],
    specialization: json["specialization"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "specialization": specialization,
  };
}

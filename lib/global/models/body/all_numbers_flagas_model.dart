import 'dart:convert';

class AllNumbersFlagModel {
  int number;
  bool booked;

  AllNumbersFlagModel({
    required this.number,
    required this.booked,
  });

  factory AllNumbersFlagModel.fromRawJson(String str) => AllNumbersFlagModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllNumbersFlagModel.fromJson(Map<String, dynamic> json) => AllNumbersFlagModel(
    number: json["number"],
    booked: json["booked"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "booked": booked,
  };
}

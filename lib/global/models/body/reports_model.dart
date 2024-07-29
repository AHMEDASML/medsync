import 'dart:convert';

class ReportsModel {
  DoctorInfo doctorInfo;
  PatientInfo patientInfo;
  String id;
  String doctor;
  String patient;
  String medicalReport;
  DateTime date;
  int v;

  ReportsModel({
    required this.doctorInfo,
    required this.patientInfo,
    required this.id,
    required this.doctor,
    required this.patient,
    required this.medicalReport,
    required this.date,
    required this.v,
  });

  factory ReportsModel.fromRawJson(String str) => ReportsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReportsModel.fromJson(Map<String, dynamic> json) => ReportsModel(
    doctorInfo: DoctorInfo.fromJson(json["doctorInfo"]),
    patientInfo: PatientInfo.fromJson(json["patientInfo"]),
    id: json["_id"],
    doctor: json["doctor"],
    patient: json["patient"],
    medicalReport: json["medicalReport"],
    date: DateTime.parse(json["date"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "doctorInfo": doctorInfo.toJson(),
    "patientInfo": patientInfo.toJson(),
    "_id": id,
    "doctor": doctor,
    "patient": patient,
    "medicalReport": medicalReport,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "__v": v,
  };
}

class DoctorInfo {
  String name;
  String phone;

  DoctorInfo({
    required this.name,
    required this.phone,
  });

  factory DoctorInfo.fromRawJson(String str) => DoctorInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DoctorInfo.fromJson(Map<String, dynamic> json) => DoctorInfo(
    name: json["name"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
  };
}

class PatientInfo {
  String firstName;
  String lastName;
  String phone;
  int age;
  String gender;

  PatientInfo({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.age,
    required this.gender,
  });

  factory PatientInfo.fromRawJson(String str) => PatientInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PatientInfo.fromJson(Map<String, dynamic> json) => PatientInfo(
    firstName: json["first_name"],
    lastName: json["last_name"],
    phone: json["phone"],
    age: json["age"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "age": age,
    "gender": gender,
  };
}

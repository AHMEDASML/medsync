import 'dart:convert';

class PrescriptionsModel {
  DoctorInfo doctorInfo;
  PatientInfo patientInfo;
  String id;
  String doctor;
  String patient;
  String patientSituation;
  List<Medication> medications;
  DateTime date;
  int v;

  PrescriptionsModel({
    required this.doctorInfo,
    required this.patientInfo,
    required this.id,
    required this.doctor,
    required this.patient,
    required this.patientSituation,
    required this.medications,
    required this.date,
    required this.v,
  });

  factory PrescriptionsModel.fromRawJson(String str) => PrescriptionsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PrescriptionsModel.fromJson(Map<String, dynamic> json) => PrescriptionsModel(
    doctorInfo: DoctorInfo.fromJson(json["doctorInfo"]),
    patientInfo: PatientInfo.fromJson(json["patientInfo"]),
    id: json["_id"],
    doctor: json["doctor"],
    patient: json["patient"],
    patientSituation: json["patientSituation"],
    medications: List<Medication>.from(json["medications"].map((x) => Medication.fromJson(x))),
    date: DateTime.parse(json["date"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "doctorInfo": doctorInfo.toJson(),
    "patientInfo": patientInfo.toJson(),
    "_id": id,
    "doctor": doctor,
    "patient": patient,
    "patientSituation": patientSituation,
    "medications": List<dynamic>.from(medications.map((x) => x.toJson())),
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

class Medication {
  String name;
  String dosage;
  String type;
  String id;

  Medication({
    required this.name,
    required this.dosage,
    required this.type,
    required this.id,
  });

  factory Medication.fromRawJson(String str) => Medication.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Medication.fromJson(Map<String, dynamic> json) => Medication(
    name: json["name"],
    dosage: json["dosage"],
    type: json["type"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "dosage": dosage,
    "type": type,
    "_id": id,
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

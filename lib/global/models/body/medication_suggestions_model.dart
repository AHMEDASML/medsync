
import 'dart:convert';

class MedicationSuggestionsModel {
  List<MedicationSuggestion> data;

  MedicationSuggestionsModel({
    required this.data,
  });

  factory MedicationSuggestionsModel.fromRawJson(String str) => MedicationSuggestionsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MedicationSuggestionsModel.fromJson(Map<String, dynamic> json) => MedicationSuggestionsModel(
    data: List<MedicationSuggestion>.from(json["data"].map((x) => MedicationSuggestion.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MedicationSuggestion {
  String brandName;

  MedicationSuggestion({
    required this.brandName,
  });

  factory MedicationSuggestion.fromRawJson(String str) => MedicationSuggestion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MedicationSuggestion.fromJson(Map<String, dynamic> json) => MedicationSuggestion(
    brandName: json["brand_name"],
  );

  Map<String, dynamic> toJson() => {
    "brand_name": brandName,
  };
}

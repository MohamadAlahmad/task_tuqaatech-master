import 'dart:convert';

CountryModel countryModelFromJson(String str) =>
    CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  CountryModel({
    required this.result,
    required this.success,
    required this.error,
  });

  List<Country> result;
  bool success;
  dynamic error;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        result:json["result"] != null ?
            List<Country>.from(json["result"].map((x) => Country.fromJson(x))) : [],
        success: json["success"] ?? '',
        error: json["error"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "success": success,
        "error": error,
      };
}

class Country {
  Country({
    required this.name,
    required this.id,
  });

  String name;
  int id;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"] ?? '',
        id: json["id"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}



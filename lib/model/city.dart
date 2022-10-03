// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
    required this.result,
    required this.success,
    required this.error,
  });

  List<City> result;
  bool success;
  dynamic error;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        result: json["result"] != null
            ? List<City>.from(json["result"].map((x) => City.fromJson(x)))
            : [],
        success: json["success"] ?? '',
        error: json["error"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "success": success,
        "error": error,
      };
}

class City {
  City({
    required this.countryId,
    required this.countryName,
    required this.name,
    required this.id,
  });

  int countryId;
  String countryName;
  String name;
  int id;

  factory City.fromJson(Map<String, dynamic> json) => City(
        countryId: json["countryId"] ?? 0,
        countryName: json["countryName"] ?? '',
        name: json["name"] ?? '',
        id: json["id"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "countryId": countryId,
        "countryName": countryName,
        "name": name,
        "id": id,
      };
}

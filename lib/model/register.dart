// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.result,
    this.error,
  });

  RegisterResult? result;
  Error? error;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        result: json["result"] == null
            ? null
            : RegisterResult.fromJson(json["result"]),
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result!.toJson(),
        "error": error!.toJson(),
      };
}

class Error {
  Error({
    required this.code,
    required this.message,
    required this.details,
  });

  int code;
  String message;
  String details;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
      code: json["code"], message: json["message"], details: json["details"]);

  Map<String, dynamic> toJson() =>
      {"code": code, "message": message, "details": details};
}

class RegisterResult {
  RegisterResult({
    required this.canLogin,
  });

  bool canLogin;

  factory RegisterResult.fromJson(Map<String, dynamic> json) => RegisterResult(
        canLogin: json["canLogin"],
      );

  Map<String, dynamic> toJson() => {
        "canLogin": canLogin,
      };
}

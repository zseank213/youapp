// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? message;
  String? accessToken;

  LoginModel({
    this.message,
    this.accessToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "access_token": accessToken,
      };
}

// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String? message;
  Data? data;

  ProfileModel({
    this.message,
    this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? email;
  String? username;
  String? name;
  String? birthday;
  String? horoscope;
  String? zodiac;
  int? height;
  int? weight;
  List<String>? interests;

  Data({
    this.email,
    this.username,
    this.name,
    this.birthday,
    this.horoscope,
    this.zodiac,
    this.height,
    this.weight,
    this.interests,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"],
        username: json["username"],
        name: json["name"],
        birthday: json["birthday"],
        horoscope: json["horoscope"],
        zodiac: json["zodiac"],
        height: json["height"],
        weight: json["weight"],
        interests:
            json["interests"] == null ? [] : List<String>.from(json["interests"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "name": name,
        "birthday": birthday,
        "horoscope": horoscope,
        "zodiac": zodiac,
        "height": height,
        "weight": weight,
        "interests": interests == null ? [] : List<dynamic>.from(interests!.map((x) => x)),
      };
}

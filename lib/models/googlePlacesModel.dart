// To parse this JSON data, do
//
//     final googlePlacesModel = googlePlacesModelFromJson(jsonString);

import 'dart:convert';

class GooglePlacesModel {
  List<Prediction>? predictions;

  GooglePlacesModel({
    this.predictions,
  });

  factory GooglePlacesModel.fromRawJson(String str) => GooglePlacesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GooglePlacesModel.fromJson(Map<String, dynamic> json) => GooglePlacesModel(
    predictions: json["predictions"] == null ? [] : List<Prediction>.from(json["predictions"]!.map((x) => Prediction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "predictions": predictions == null ? [] : List<dynamic>.from(predictions!.map((x) => x.toJson())),
  };
}

class Prediction {
  int? distanceMeters;
  String? placeId;
  String? primaryText;
  String? secondaryText;
  String? fullText;

  Prediction({
    this.distanceMeters,
    this.placeId,
    this.primaryText,
    this.secondaryText,
    this.fullText,
  });

  factory Prediction.fromRawJson(String str) => Prediction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
    distanceMeters: json["distanceMeters"],
    placeId: json["placeId"],
    primaryText: json["primaryText"],
    secondaryText: json["secondaryText"],
    fullText: json["fullText"],
  );

  Map<String, dynamic> toJson() => {
    "distanceMeters": distanceMeters,
    "placeId": placeId,
    "primaryText": primaryText,
    "secondaryText": secondaryText,
    "fullText": fullText,
  };
}

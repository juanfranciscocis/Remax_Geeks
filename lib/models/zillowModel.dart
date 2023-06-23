// To parse this JSON data, do
//
//     final zillowSearchModel = zillowSearchModelFromJson(jsonString);

import 'dart:convert';

class ZillowSearchModel {
  List<Result>? results;
  bool? success;

  ZillowSearchModel({
    this.results,
    this.success,
  });

  factory ZillowSearchModel.fromRawJson(String str) => ZillowSearchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ZillowSearchModel.fromJson(Map<String, dynamic> json) => ZillowSearchModel(
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    "success": success,
  };
}

class Result {
  String? display;
  MetaData? metaData;
  String? resultType;

  Result({
    this.display,
    this.metaData,
    this.resultType,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    display: json["display"],
    metaData: json["metaData"] == null ? null : MetaData.fromJson(json["metaData"]),
    resultType: json["resultType"],
  );

  Map<String, dynamic> toJson() => {
    "display": display,
    "metaData": metaData?.toJson(),
    "resultType": resultType,
  };
}

class MetaData {
  String? addressType;
  String? city;
  String? country;
  double? lat;
  double? lng;
  int? maloneId;
  String? state;
  String? streetName;
  String? streetNumber;
  String? zipCode;
  int? zpid;

  MetaData({
    this.addressType,
    this.city,
    this.country,
    this.lat,
    this.lng,
    this.maloneId,
    this.state,
    this.streetName,
    this.streetNumber,
    this.zipCode,
    this.zpid,
  });

  factory MetaData.fromRawJson(String str) => MetaData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
    addressType: json["addressType"],
    city: json["city"],
    country: json["country"],
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
    maloneId: json["maloneId"],
    state: json["state"],
    streetName: json["streetName"],
    streetNumber: json["streetNumber"],
    zipCode: json["zipCode"],
    zpid: json["zpid"],
  );

  Map<String, dynamic> toJson() => {
    "addressType": addressType,
    "city": city,
    "country": country,
    "lat": lat,
    "lng": lng,
    "maloneId": maloneId,
    "state": state,
    "streetName": streetName,
    "streetNumber": streetNumber,
    "zipCode": zipCode,
    "zpid": zpid,
  };
}

// To parse this JSON data, do
//
//     final zillowModel = zillowModelFromJson(jsonString);
class ZillowModel {
  bool? success;
  double? zestimate;

  ZillowModel({
    this.success,
    this.zestimate,
  });

  factory ZillowModel.fromRawJson(String str) => ZillowModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ZillowModel.fromJson(Map<String, dynamic> json) => ZillowModel(
    success: json["success"],
    zestimate: json["zestimate"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "zestimate": zestimate,
  };
}


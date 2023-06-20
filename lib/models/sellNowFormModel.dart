// To parse this JSON data, do
//
//     final sellingForm = sellingFormFromJson(jsonString);

import 'dart:convert';

class SellingForm {
  String? address;
  String? condition;
  String? type;
  String? serviceType;

  SellingForm({
    this.address,
    this.condition,
    this.type,
    this.serviceType,
  });

  factory SellingForm.fromRawJson(String str) => SellingForm.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SellingForm.fromJson(Map<String, dynamic> json) => SellingForm(
    address: json["ADDRESS"],
    condition: json["CONDITION"],
    type: json["TYPE"],
    serviceType: json["SERVICE_TYPE"],
  );

  Map<String, dynamic> toJson() => {
    "ADDRESS": address,
    "CONDITION": condition,
    "TYPE": type,
    "SERVICE_TYPE": serviceType,
  };
}

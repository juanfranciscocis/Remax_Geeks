// To parse this JSON data, do
//
//     final sellingForm = sellingFormFromJson(jsonString);

import 'dart:convert';

class SellingForm {
  String? address;
  String? condition;
  String? type;

  SellingForm({
    this.address,
    this.condition,
    this.type,
  });

  factory SellingForm.fromRawJson(String str) => SellingForm.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SellingForm.fromJson(Map<String, dynamic> json) => SellingForm(
    address: json["ADDRESS"],
    condition: json["CONDITION"],
    type: json["TYPE"],
  );

  Map<String, dynamic> toJson() => {
    "ADDRESS": address,
    "CONDITION": condition,
    "TYPE": type,
  };
}

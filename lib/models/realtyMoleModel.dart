// To parse this JSON data, do
//
//     final realtyMoleModel = realtyMoleModelFromJson(jsonString);

import 'dart:convert';

class RealtyMoleModel {
    double? price;
    double? priceRangeLow;
    double? priceRangeHigh;
    double? longitude;
    double? latitude;
    List<Listing>? listings;

    RealtyMoleModel({
        this.price,
        this.priceRangeLow,
        this.priceRangeHigh,
        this.longitude,
        this.latitude,
        this.listings,
    });

    factory RealtyMoleModel.fromRawJson(String str) => RealtyMoleModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RealtyMoleModel.fromJson(Map<String, dynamic> json) => RealtyMoleModel(
        price: json["price"]?.toDouble(),
        priceRangeLow: json["priceRangeLow"]?.toDouble(),
        priceRangeHigh: json["priceRangeHigh"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
        listings: json["listings"] == null ? [] : List<Listing>.from(json["listings"]!.map((x) => Listing.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "price": price,
        "priceRangeLow": priceRangeLow,
        "priceRangeHigh": priceRangeHigh,
        "longitude": longitude,
        "latitude": latitude,
        "listings": listings == null ? [] : List<dynamic>.from(listings!.map((x) => x.toJson())),
    };
}

class Listing {
    String? id;
    String? formattedAddress;
    double? longitude;
    double? latitude;
    String? city;
    String? state;
    String? zipcode;
    int? price;
    DateTime? publishedDate;
    double? distance;
    double? daysOld;
    double? correlation;
    String? address;
    String? county;
    int? bedrooms;
    double? bathrooms;
    String? propertyType;
    int? squareFootage;
    int? lotSize;
    int? yearBuilt;

    Listing({
        this.id,
        this.formattedAddress,
        this.longitude,
        this.latitude,
        this.city,
        this.state,
        this.zipcode,
        this.price,
        this.publishedDate,
        this.distance,
        this.daysOld,
        this.correlation,
        this.address,
        this.county,
        this.bedrooms,
        this.bathrooms,
        this.propertyType,
        this.squareFootage,
        this.lotSize,
        this.yearBuilt,
    });

    factory Listing.fromRawJson(String str) => Listing.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Listing.fromJson(Map<String, dynamic> json) => Listing(
        id: json["id"],
        formattedAddress: json["formattedAddress"],
        longitude: json["longitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
        city: json["city"],
        state: json["state"],
        zipcode: json["zipcode"],
        price: json["price"],
        publishedDate: json["publishedDate"] == null ? null : DateTime.parse(json["publishedDate"]),
        distance: json["distance"]?.toDouble(),
        daysOld: json["daysOld"]?.toDouble(),
        correlation: json["correlation"]?.toDouble(),
        address: json["address"],
        county: json["county"],
        bedrooms: json["bedrooms"],
        bathrooms: json["bathrooms"]?.toDouble(),
        propertyType: json["propertyType"],
        squareFootage: json["squareFootage"],
        lotSize: json["lotSize"],
        yearBuilt: json["yearBuilt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "formattedAddress": formattedAddress,
        "longitude": longitude,
        "latitude": latitude,
        "city": city,
        "state": state,
        "zipcode": zipcode,
        "price": price,
        "publishedDate": publishedDate?.toIso8601String(),
        "distance": distance,
        "daysOld": daysOld,
        "correlation": correlation,
        "address": address,
        "county": county,
        "bedrooms": bedrooms,
        "bathrooms": bathrooms,
        "propertyType": propertyType,
        "squareFootage": squareFootage,
        "lotSize": lotSize,
        "yearBuilt": yearBuilt,
    };
}

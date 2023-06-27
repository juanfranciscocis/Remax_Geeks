// To parse this JSON data, do
//
//     final zillowModel = zillowModelFromJson(jsonString);

import 'dart:convert';

class ZillowModel {
  ZillowModelAddress? address;
  ZillowModelAttributionInfo? attributionInfo;
  int? bathrooms;
  int? bedrooms;
  dynamic brokerageName;
  String? city;
  dynamic comingSoonOnMarketDate;
  dynamic contingentListingType;
  String? countyFips;
  String? datePostedString;
  int? daysOnZillow;
  String? description;
  int? favoriteCount;
  String? hdpTypeDimension;
  String? hdpUrl;
  String? hiResImageLink;
  dynamic homeInsights;
  String? homeStatus;
  String? homeType;
  int? lastSoldPrice;
  double? latitude;
  String? listingDataSource;
  ListingProvider? listingProvider;
  String? listingTypeDimension;
  ListingSubType? listingSubType;
  int? livingArea;
  String? livingAreaUnitsShort;
  double? longitude;
  double? lotAreaValue;
  int? lotSize;
  dynamic mlsid;
  int? monthlyHoaFee;
  MortgageRates? mortgageRates;
  List<NearbyHome>? nearbyHomes;
  dynamic neighborhoodSearchUrl;
  int? pageViewCount;
  List<ZillowModelPhoto>? photos;
  int? price;
  List<PriceHistory>? priceHistory;
  dynamic primaryPublicVideo;
  double? propertyTaxRate;
  String? propertyTypeDimension;
  int? rentZestimate;
  ResoFacts? resoFacts;
  List<ResponsivePhoto>? responsivePhotos;
  String? restimateHighPercent;
  String? restimateLowPercent;
  List<School>? schools;
  String? state;
  StaticMap? staticMap;
  List<TaxHistory>? taxHistory;
  String? timeOnZillow;
  TourEligibility? tourEligibility;
  dynamic virtualTourUrl;
  int? yearBuilt;
  double? zestimate;
  String? zestimateHighPercent;
  String? zestimateLowPercent;
  int? zpid;

  ZillowModel({
    this.address,
    this.attributionInfo,
    this.bathrooms,
    this.bedrooms,
    this.brokerageName,
    this.city,
    this.comingSoonOnMarketDate,
    this.contingentListingType,
    this.countyFips,
    this.datePostedString,
    this.daysOnZillow,
    this.description,
    this.favoriteCount,
    this.hdpTypeDimension,
    this.hdpUrl,
    this.hiResImageLink,
    this.homeInsights,
    this.homeStatus,
    this.homeType,
    this.lastSoldPrice,
    this.latitude,
    this.listingDataSource,
    this.listingProvider,
    this.listingTypeDimension,
    this.listingSubType,
    this.livingArea,
    this.livingAreaUnitsShort,
    this.longitude,
    this.lotAreaValue,
    this.lotSize,
    this.mlsid,
    this.monthlyHoaFee,
    this.mortgageRates,
    this.nearbyHomes,
    this.neighborhoodSearchUrl,
    this.pageViewCount,
    this.photos,
    this.price,
    this.priceHistory,
    this.primaryPublicVideo,
    this.propertyTaxRate,
    this.propertyTypeDimension,
    this.rentZestimate,
    this.resoFacts,
    this.responsivePhotos,
    this.restimateHighPercent,
    this.restimateLowPercent,
    this.schools,
    this.state,
    this.staticMap,
    this.taxHistory,
    this.timeOnZillow,
    this.tourEligibility,
    this.virtualTourUrl,
    this.yearBuilt,
    this.zestimate,
    this.zestimateHighPercent,
    this.zestimateLowPercent,
    this.zpid,
  });

  factory ZillowModel.fromRawJson(String str) => ZillowModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ZillowModel.fromJson(Map<String, dynamic> json) => ZillowModel(
    address: json["address"] == null ? null : ZillowModelAddress.fromJson(json["address"]),
    attributionInfo: json["attributionInfo"] == null ? null : ZillowModelAttributionInfo.fromJson(json["attributionInfo"]),
    bathrooms: json["bathrooms"],
    bedrooms: json["bedrooms"],
    brokerageName: json["brokerageName"],
    city: json["city"],
    comingSoonOnMarketDate: json["comingSoonOnMarketDate"],
    contingentListingType: json["contingentListingType"],
    countyFips: json["countyFIPS"],
    datePostedString: json["datePostedString"],
    daysOnZillow: json["daysOnZillow"],
    description: json["description"],
    favoriteCount: json["favoriteCount"],
    hdpTypeDimension: json["hdpTypeDimension"],
    hdpUrl: json["hdpUrl"],
    hiResImageLink: json["hiResImageLink"],
    homeInsights: json["homeInsights"],
    homeStatus: json["homeStatus"],
    homeType: json["homeType"],
    lastSoldPrice: json["lastSoldPrice"],
    latitude: json["latitude"]?.toDouble(),
    listingDataSource: json["listingDataSource"],
    listingProvider: json["listingProvider"] == null ? null : ListingProvider.fromJson(json["listingProvider"]),
    listingTypeDimension: json["listingTypeDimension"],
    listingSubType: json["listing_sub_type"] == null ? null : ListingSubType.fromJson(json["listing_sub_type"]),
    livingArea: json["livingArea"],
    livingAreaUnitsShort: json["livingAreaUnitsShort"],
    longitude: json["longitude"]?.toDouble(),
    lotAreaValue: json["lotAreaValue"]?.toDouble(),
    lotSize: json["lotSize"],
    mlsid: json["mlsid"],
    monthlyHoaFee: json["monthlyHoaFee"],
    mortgageRates: json["mortgageRates"] == null ? null : MortgageRates.fromJson(json["mortgageRates"]),
    nearbyHomes: json["nearbyHomes"] == null ? [] : List<NearbyHome>.from(json["nearbyHomes"]!.map((x) => NearbyHome.fromJson(x))),
    neighborhoodSearchUrl: json["neighborhoodSearchUrl"],
    pageViewCount: json["pageViewCount"],
    photos: json["photos"] == null ? [] : List<ZillowModelPhoto>.from(json["photos"]!.map((x) => ZillowModelPhoto.fromJson(x))),
    price: json["price"],
    priceHistory: json["priceHistory"] == null ? [] : List<PriceHistory>.from(json["priceHistory"]!.map((x) => PriceHistory.fromJson(x))),
    primaryPublicVideo: json["primaryPublicVideo"],
    propertyTaxRate: json["propertyTaxRate"]?.toDouble(),
    propertyTypeDimension: json["propertyTypeDimension"],
    rentZestimate: json["rentZestimate"],
    resoFacts: json["resoFacts"] == null ? null : ResoFacts.fromJson(json["resoFacts"]),
    responsivePhotos: json["responsivePhotos"] == null ? [] : List<ResponsivePhoto>.from(json["responsivePhotos"]!.map((x) => ResponsivePhoto.fromJson(x))),
    restimateHighPercent: json["restimateHighPercent"],
    restimateLowPercent: json["restimateLowPercent"],
    schools: json["schools"] == null ? [] : List<School>.from(json["schools"]!.map((x) => School.fromJson(x))),
    state: json["state"],
    staticMap: json["staticMap"] == null ? null : StaticMap.fromJson(json["staticMap"]),
    taxHistory: json["taxHistory"] == null ? [] : List<TaxHistory>.from(json["taxHistory"]!.map((x) => TaxHistory.fromJson(x))),
    timeOnZillow: json["timeOnZillow"],
    tourEligibility: json["tourEligibility"] == null ? null : TourEligibility.fromJson(json["tourEligibility"]),
    virtualTourUrl: json["virtualTourUrl"],
    yearBuilt: json["yearBuilt"],
    zestimate: json["zestimate"],
    zestimateHighPercent: json["zestimateHighPercent"],
    zestimateLowPercent: json["zestimateLowPercent"],
    zpid: json["zpid"],
  );

  Map<String, dynamic> toJson() => {
    "address": address?.toJson(),
    "attributionInfo": attributionInfo?.toJson(),
    "bathrooms": bathrooms,
    "bedrooms": bedrooms,
    "brokerageName": brokerageName,
    "city": city,
    "comingSoonOnMarketDate": comingSoonOnMarketDate,
    "contingentListingType": contingentListingType,
    "countyFIPS": countyFips,
    "datePostedString": datePostedString,
    "daysOnZillow": daysOnZillow,
    "description": description,
    "favoriteCount": favoriteCount,
    "hdpTypeDimension": hdpTypeDimension,
    "hdpUrl": hdpUrl,
    "hiResImageLink": hiResImageLink,
    "homeInsights": homeInsights,
    "homeStatus": homeStatus,
    "homeType": homeType,
    "lastSoldPrice": lastSoldPrice,
    "latitude": latitude,
    "listingDataSource": listingDataSource,
    "listingProvider": listingProvider?.toJson(),
    "listingTypeDimension": listingTypeDimension,
    "listing_sub_type": listingSubType?.toJson(),
    "livingArea": livingArea,
    "livingAreaUnitsShort": livingAreaUnitsShort,
    "longitude": longitude,
    "lotAreaValue": lotAreaValue,
    "lotSize": lotSize,
    "mlsid": mlsid,
    "monthlyHoaFee": monthlyHoaFee,
    "mortgageRates": mortgageRates?.toJson(),
    "nearbyHomes": nearbyHomes == null ? [] : List<dynamic>.from(nearbyHomes!.map((x) => x.toJson())),
    "neighborhoodSearchUrl": neighborhoodSearchUrl,
    "pageViewCount": pageViewCount,
    "photos": photos == null ? [] : List<dynamic>.from(photos!.map((x) => x.toJson())),
    "price": price,
    "priceHistory": priceHistory == null ? [] : List<dynamic>.from(priceHistory!.map((x) => x.toJson())),
    "primaryPublicVideo": primaryPublicVideo,
    "propertyTaxRate": propertyTaxRate,
    "propertyTypeDimension": propertyTypeDimension,
    "rentZestimate": rentZestimate,
    "resoFacts": resoFacts?.toJson(),
    "responsivePhotos": responsivePhotos == null ? [] : List<dynamic>.from(responsivePhotos!.map((x) => x.toJson())),
    "restimateHighPercent": restimateHighPercent,
    "restimateLowPercent": restimateLowPercent,
    "schools": schools == null ? [] : List<dynamic>.from(schools!.map((x) => x.toJson())),
    "state": state,
    "staticMap": staticMap?.toJson(),
    "taxHistory": taxHistory == null ? [] : List<dynamic>.from(taxHistory!.map((x) => x.toJson())),
    "timeOnZillow": timeOnZillow,
    "tourEligibility": tourEligibility?.toJson(),
    "virtualTourUrl": virtualTourUrl,
    "yearBuilt": yearBuilt,
    "zestimate": zestimate,
    "zestimateHighPercent": zestimateHighPercent,
    "zestimateLowPercent": zestimateLowPercent,
    "zpid": zpid,
  };
}

class ZillowModelAddress {
  String? city;
  dynamic community;
  dynamic neighborhood;
  String? state;
  String? streetAddress;
  dynamic subdivision;
  String? zipcode;

  ZillowModelAddress({
    this.city,
    this.community,
    this.neighborhood,
    this.state,
    this.streetAddress,
    this.subdivision,
    this.zipcode,
  });

  factory ZillowModelAddress.fromRawJson(String str) => ZillowModelAddress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ZillowModelAddress.fromJson(Map<String, dynamic> json) => ZillowModelAddress(
    city: json["city"],
    community: json["community"],
    neighborhood: json["neighborhood"],
    state: json["state"],
    streetAddress: json["streetAddress"],
    subdivision: json["subdivision"],
    zipcode: json["zipcode"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "community": community,
    "neighborhood": neighborhood,
    "state": state,
    "streetAddress": streetAddress,
    "subdivision": subdivision,
    "zipcode": zipcode,
  };
}

class ZillowModelAttributionInfo {
  dynamic agentEmail;
  dynamic agentLicenseNumber;
  dynamic agentName;
  dynamic agentPhoneNumber;
  dynamic attributionTitle;
  dynamic brokerName;
  dynamic brokerPhoneNumber;
  dynamic buyerAgentMemberStateLicense;
  dynamic buyerAgentName;
  dynamic buyerBrokerageName;
  dynamic coAgentLicenseNumber;
  dynamic coAgentName;
  dynamic coAgentNumber;
  dynamic infoString10;
  dynamic infoString16;
  dynamic infoString3;
  dynamic infoString5;
  dynamic lastChecked;
  dynamic lastUpdated;
  List<dynamic>? listingAgents;
  dynamic listingAgreement;
  List<ListingOffice>? listingOffices;
  dynamic mlsDisclaimer;
  dynamic mlsId;
  dynamic mlsName;
  dynamic providerLogo;
  dynamic trueStatus;

  ZillowModelAttributionInfo({
    this.agentEmail,
    this.agentLicenseNumber,
    this.agentName,
    this.agentPhoneNumber,
    this.attributionTitle,
    this.brokerName,
    this.brokerPhoneNumber,
    this.buyerAgentMemberStateLicense,
    this.buyerAgentName,
    this.buyerBrokerageName,
    this.coAgentLicenseNumber,
    this.coAgentName,
    this.coAgentNumber,
    this.infoString10,
    this.infoString16,
    this.infoString3,
    this.infoString5,
    this.lastChecked,
    this.lastUpdated,
    this.listingAgents,
    this.listingAgreement,
    this.listingOffices,
    this.mlsDisclaimer,
    this.mlsId,
    this.mlsName,
    this.providerLogo,
    this.trueStatus,
  });

  factory ZillowModelAttributionInfo.fromRawJson(String str) => ZillowModelAttributionInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ZillowModelAttributionInfo.fromJson(Map<String, dynamic> json) => ZillowModelAttributionInfo(
    agentEmail: json["agentEmail"],
    agentLicenseNumber: json["agentLicenseNumber"],
    agentName: json["agentName"],
    agentPhoneNumber: json["agentPhoneNumber"],
    attributionTitle: json["attributionTitle"],
    brokerName: json["brokerName"],
    brokerPhoneNumber: json["brokerPhoneNumber"],
    buyerAgentMemberStateLicense: json["buyerAgentMemberStateLicense"],
    buyerAgentName: json["buyerAgentName"],
    buyerBrokerageName: json["buyerBrokerageName"],
    coAgentLicenseNumber: json["coAgentLicenseNumber"],
    coAgentName: json["coAgentName"],
    coAgentNumber: json["coAgentNumber"],
    infoString10: json["infoString10"],
    infoString16: json["infoString16"],
    infoString3: json["infoString3"],
    infoString5: json["infoString5"],
    lastChecked: json["lastChecked"],
    lastUpdated: json["lastUpdated"],
    listingAgents: json["listingAgents"] == null ? [] : List<dynamic>.from(json["listingAgents"]!.map((x) => x)),
    listingAgreement: json["listingAgreement"],
    listingOffices: json["listingOffices"] == null ? [] : List<ListingOffice>.from(json["listingOffices"]!.map((x) => ListingOffice.fromJson(x))),
    mlsDisclaimer: json["mlsDisclaimer"],
    mlsId: json["mlsId"],
    mlsName: json["mlsName"],
    providerLogo: json["providerLogo"],
    trueStatus: json["trueStatus"],
  );

  Map<String, dynamic> toJson() => {
    "agentEmail": agentEmail,
    "agentLicenseNumber": agentLicenseNumber,
    "agentName": agentName,
    "agentPhoneNumber": agentPhoneNumber,
    "attributionTitle": attributionTitle,
    "brokerName": brokerName,
    "brokerPhoneNumber": brokerPhoneNumber,
    "buyerAgentMemberStateLicense": buyerAgentMemberStateLicense,
    "buyerAgentName": buyerAgentName,
    "buyerBrokerageName": buyerBrokerageName,
    "coAgentLicenseNumber": coAgentLicenseNumber,
    "coAgentName": coAgentName,
    "coAgentNumber": coAgentNumber,
    "infoString10": infoString10,
    "infoString16": infoString16,
    "infoString3": infoString3,
    "infoString5": infoString5,
    "lastChecked": lastChecked,
    "lastUpdated": lastUpdated,
    "listingAgents": listingAgents == null ? [] : List<dynamic>.from(listingAgents!.map((x) => x)),
    "listingAgreement": listingAgreement,
    "listingOffices": listingOffices == null ? [] : List<dynamic>.from(listingOffices!.map((x) => x.toJson())),
    "mlsDisclaimer": mlsDisclaimer,
    "mlsId": mlsId,
    "mlsName": mlsName,
    "providerLogo": providerLogo,
    "trueStatus": trueStatus,
  };
}

class ListingOffice {
  String? associatedOfficeType;
  dynamic officeName;

  ListingOffice({
    this.associatedOfficeType,
    this.officeName,
  });

  factory ListingOffice.fromRawJson(String str) => ListingOffice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListingOffice.fromJson(Map<String, dynamic> json) => ListingOffice(
    associatedOfficeType: json["associatedOfficeType"],
    officeName: json["officeName"],
  );

  Map<String, dynamic> toJson() => {
    "associatedOfficeType": associatedOfficeType,
    "officeName": officeName,
  };
}

class ListingProvider {
  List<dynamic>? logos;

  ListingProvider({
    this.logos,
  });

  factory ListingProvider.fromRawJson(String str) => ListingProvider.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListingProvider.fromJson(Map<String, dynamic> json) => ListingProvider(
    logos: json["logos"] == null ? [] : List<dynamic>.from(json["logos"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "logos": logos == null ? [] : List<dynamic>.from(logos!.map((x) => x)),
  };
}

class ListingSubType {
  bool? isFsba;
  bool? isFsbo;
  bool? isBankOwned;
  bool? isComingSoon;
  bool? isForAuction;
  bool? isForeclosure;
  bool? isNewHome;
  bool? isOpenHouse;
  bool? isPending;

  ListingSubType({
    this.isFsba,
    this.isFsbo,
    this.isBankOwned,
    this.isComingSoon,
    this.isForAuction,
    this.isForeclosure,
    this.isNewHome,
    this.isOpenHouse,
    this.isPending,
  });

  factory ListingSubType.fromRawJson(String str) => ListingSubType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListingSubType.fromJson(Map<String, dynamic> json) => ListingSubType(
    isFsba: json["is_FSBA"],
    isFsbo: json["is_FSBO"],
    isBankOwned: json["is_bankOwned"],
    isComingSoon: json["is_comingSoon"],
    isForAuction: json["is_forAuction"],
    isForeclosure: json["is_foreclosure"],
    isNewHome: json["is_newHome"],
    isOpenHouse: json["is_openHouse"],
    isPending: json["is_pending"],
  );

  Map<String, dynamic> toJson() => {
    "is_FSBA": isFsba,
    "is_FSBO": isFsbo,
    "is_bankOwned": isBankOwned,
    "is_comingSoon": isComingSoon,
    "is_forAuction": isForAuction,
    "is_foreclosure": isForeclosure,
    "is_newHome": isNewHome,
    "is_openHouse": isOpenHouse,
    "is_pending": isPending,
  };
}

class MortgageRates {
  double? arm5Rate;
  double? fifteenYearFixedRate;
  double? thirtyYearFixedRate;

  MortgageRates({
    this.arm5Rate,
    this.fifteenYearFixedRate,
    this.thirtyYearFixedRate,
  });

  factory MortgageRates.fromRawJson(String str) => MortgageRates.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MortgageRates.fromJson(Map<String, dynamic> json) => MortgageRates(
    arm5Rate: json["arm5Rate"]?.toDouble(),
    fifteenYearFixedRate: json["fifteenYearFixedRate"]?.toDouble(),
    thirtyYearFixedRate: json["thirtyYearFixedRate"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "arm5Rate": arm5Rate,
    "fifteenYearFixedRate": fifteenYearFixedRate,
    "thirtyYearFixedRate": thirtyYearFixedRate,
  };
}

class NearbyHome {
  NearbyHomeAddress? address;
  NearbyHomeAttributionInfo? attributionInfo;
  double? bathrooms;
  int? bedrooms;
  String? currency;
  FormattedChip? formattedChip;
  String? hdpUrl;
  String? homeStatus;
  String? homeType;
  bool? isPremierBuilder;
  bool? isZillowOwned;
  double? latitude;
  ListingMetadata? listingMetadata;
  ListingSubType? listingSubType;
  int? livingArea;
  String? livingAreaUnits;
  String? livingAreaUnitsShort;
  int? livingAreaValue;
  double? longitude;
  String? lotAreaUnits;
  double? lotAreaValue;
  int? lotSize;
  List<MiniCardPhotoElement>? miniCardPhotos;
  dynamic newConstructionType;
  int? price;
  dynamic providerListingId;
  String? state;
  int? zpid;

  NearbyHome({
    this.address,
    this.attributionInfo,
    this.bathrooms,
    this.bedrooms,
    this.currency,
    this.formattedChip,
    this.hdpUrl,
    this.homeStatus,
    this.homeType,
    this.isPremierBuilder,
    this.isZillowOwned,
    this.latitude,
    this.listingMetadata,
    this.listingSubType,
    this.livingArea,
    this.livingAreaUnits,
    this.livingAreaUnitsShort,
    this.livingAreaValue,
    this.longitude,
    this.lotAreaUnits,
    this.lotAreaValue,
    this.lotSize,
    this.miniCardPhotos,
    this.newConstructionType,
    this.price,
    this.providerListingId,
    this.state,
    this.zpid,
  });

  factory NearbyHome.fromRawJson(String str) => NearbyHome.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NearbyHome.fromJson(Map<String, dynamic> json) => NearbyHome(
    address: json["address"] == null ? null : NearbyHomeAddress.fromJson(json["address"]),
    attributionInfo: json["attributionInfo"] == null ? null : NearbyHomeAttributionInfo.fromJson(json["attributionInfo"]),
    bathrooms: json["bathrooms"]?.toDouble(),
    bedrooms: json["bedrooms"],
    currency: json["currency"],
    formattedChip: json["formattedChip"] == null ? null : FormattedChip.fromJson(json["formattedChip"]),
    hdpUrl: json["hdpUrl"],
    homeStatus: json["homeStatus"],
    homeType: json["homeType"],
    isPremierBuilder: json["isPremierBuilder"],
    isZillowOwned: json["isZillowOwned"],
    latitude: json["latitude"]?.toDouble(),
    listingMetadata: json["listingMetadata"] == null ? null : ListingMetadata.fromJson(json["listingMetadata"]),
    listingSubType: json["listing_sub_type"] == null ? null : ListingSubType.fromJson(json["listing_sub_type"]),
    livingArea: json["livingArea"],
    livingAreaUnits: json["livingAreaUnits"],
    livingAreaUnitsShort: json["livingAreaUnitsShort"],
    livingAreaValue: json["livingAreaValue"],
    longitude: json["longitude"]?.toDouble(),
    lotAreaUnits: json["lotAreaUnits"],
    lotAreaValue: json["lotAreaValue"]?.toDouble(),
    lotSize: json["lotSize"],
    miniCardPhotos: json["miniCardPhotos"] == null ? [] : List<MiniCardPhotoElement>.from(json["miniCardPhotos"]!.map((x) => MiniCardPhotoElement.fromJson(x))),
    newConstructionType: json["newConstructionType"],
    price: json["price"],
    providerListingId: json["providerListingID"],
    state: json["state"],
    zpid: json["zpid"],
  );

  Map<String, dynamic> toJson() => {
    "address": address?.toJson(),
    "attributionInfo": attributionInfo?.toJson(),
    "bathrooms": bathrooms,
    "bedrooms": bedrooms,
    "currency": currency,
    "formattedChip": formattedChip?.toJson(),
    "hdpUrl": hdpUrl,
    "homeStatus": homeStatus,
    "homeType": homeType,
    "isPremierBuilder": isPremierBuilder,
    "isZillowOwned": isZillowOwned,
    "latitude": latitude,
    "listingMetadata": listingMetadata?.toJson(),
    "listing_sub_type": listingSubType?.toJson(),
    "livingArea": livingArea,
    "livingAreaUnits": livingAreaUnits,
    "livingAreaUnitsShort": livingAreaUnitsShort,
    "livingAreaValue": livingAreaValue,
    "longitude": longitude,
    "lotAreaUnits": lotAreaUnits,
    "lotAreaValue": lotAreaValue,
    "lotSize": lotSize,
    "miniCardPhotos": miniCardPhotos == null ? [] : List<dynamic>.from(miniCardPhotos!.map((x) => x.toJson())),
    "newConstructionType": newConstructionType,
    "price": price,
    "providerListingID": providerListingId,
    "state": state,
    "zpid": zpid,
  };
}

class NearbyHomeAddress {
  String? city;
  String? state;
  String? streetAddress;
  String? zipcode;

  NearbyHomeAddress({
    this.city,
    this.state,
    this.streetAddress,
    this.zipcode,
  });

  factory NearbyHomeAddress.fromRawJson(String str) => NearbyHomeAddress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NearbyHomeAddress.fromJson(Map<String, dynamic> json) => NearbyHomeAddress(
    city: json["city"],
    state: json["state"],
    streetAddress: json["streetAddress"],
    zipcode: json["zipcode"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "state": state,
    "streetAddress": streetAddress,
    "zipcode": zipcode,
  };
}

class NearbyHomeAttributionInfo {
  dynamic agentName;
  dynamic agentPhoneNumber;
  dynamic brokerName;
  dynamic brokerPhoneNumber;
  dynamic mlsId;
  dynamic mlsName;
  dynamic providerLogo;
  dynamic trueStatus;

  NearbyHomeAttributionInfo({
    this.agentName,
    this.agentPhoneNumber,
    this.brokerName,
    this.brokerPhoneNumber,
    this.mlsId,
    this.mlsName,
    this.providerLogo,
    this.trueStatus,
  });

  factory NearbyHomeAttributionInfo.fromRawJson(String str) => NearbyHomeAttributionInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NearbyHomeAttributionInfo.fromJson(Map<String, dynamic> json) => NearbyHomeAttributionInfo(
    agentName: json["agentName"],
    agentPhoneNumber: json["agentPhoneNumber"],
    brokerName: json["brokerName"],
    brokerPhoneNumber: json["brokerPhoneNumber"],
    mlsId: json["mlsId"],
    mlsName: json["mlsName"],
    providerLogo: json["providerLogo"],
    trueStatus: json["trueStatus"],
  );

  Map<String, dynamic> toJson() => {
    "agentName": agentName,
    "agentPhoneNumber": agentPhoneNumber,
    "brokerName": brokerName,
    "brokerPhoneNumber": brokerPhoneNumber,
    "mlsId": mlsId,
    "mlsName": mlsName,
    "providerLogo": providerLogo,
    "trueStatus": trueStatus,
  };
}

class FormattedChip {
  List<Location>? location;

  FormattedChip({
    this.location,
  });

  factory FormattedChip.fromRawJson(String str) => FormattedChip.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FormattedChip.fromJson(Map<String, dynamic> json) => FormattedChip(
    location: json["location"] == null ? [] : List<Location>.from(json["location"]!.map((x) => Location.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "location": location == null ? [] : List<dynamic>.from(location!.map((x) => x.toJson())),
  };
}

class Location {
  String? fullValue;

  Location({
    this.fullValue,
  });

  factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    fullValue: json["fullValue"],
  );

  Map<String, dynamic> toJson() => {
    "fullValue": fullValue,
  };
}

class ListingMetadata {
  bool? comminglingCategoryIsRulesApplicable;

  ListingMetadata({
    this.comminglingCategoryIsRulesApplicable,
  });

  factory ListingMetadata.fromRawJson(String str) => ListingMetadata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListingMetadata.fromJson(Map<String, dynamic> json) => ListingMetadata(
    comminglingCategoryIsRulesApplicable: json["comminglingCategoryIsRulesApplicable"],
  );

  Map<String, dynamic> toJson() => {
    "comminglingCategoryIsRulesApplicable": comminglingCategoryIsRulesApplicable,
  };
}

class MiniCardPhotoElement {
  String? url;

  MiniCardPhotoElement({
    this.url,
  });

  factory MiniCardPhotoElement.fromRawJson(String str) => MiniCardPhotoElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MiniCardPhotoElement.fromJson(Map<String, dynamic> json) => MiniCardPhotoElement(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}

class ZillowModelPhoto {
  String? caption;
  MixedSources? mixedSources;

  ZillowModelPhoto({
    this.caption,
    this.mixedSources,
  });

  factory ZillowModelPhoto.fromRawJson(String str) => ZillowModelPhoto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ZillowModelPhoto.fromJson(Map<String, dynamic> json) => ZillowModelPhoto(
    caption: json["caption"],
    mixedSources: json["mixedSources"] == null ? null : MixedSources.fromJson(json["mixedSources"]),
  );

  Map<String, dynamic> toJson() => {
    "caption": caption,
    "mixedSources": mixedSources?.toJson(),
  };
}

class MixedSources {
  List<Source>? jpeg;
  List<Source>? webp;

  MixedSources({
    this.jpeg,
    this.webp,
  });

  factory MixedSources.fromRawJson(String str) => MixedSources.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MixedSources.fromJson(Map<String, dynamic> json) => MixedSources(
    jpeg: json["jpeg"] == null ? [] : List<Source>.from(json["jpeg"]!.map((x) => Source.fromJson(x))),
    webp: json["webp"] == null ? [] : List<Source>.from(json["webp"]!.map((x) => Source.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "jpeg": jpeg == null ? [] : List<dynamic>.from(jpeg!.map((x) => x.toJson())),
    "webp": webp == null ? [] : List<dynamic>.from(webp!.map((x) => x.toJson())),
  };
}

class Source {
  String? url;
  int? width;

  Source({
    this.url,
    this.width,
  });

  factory Source.fromRawJson(String str) => Source.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    url: json["url"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
  };
}

class PriceHistory {
  AttributeSource? attributeSource;
  ErAgent? buyerAgent;
  DateTime? date;
  String? event;
  bool? postingIsRental;
  int? price;
  double? priceChangeRate;
  int? pricePerSquareFoot;
  ErAgent? sellerAgent;
  bool? showCountyLink;
  String? source;
  int? time;

  PriceHistory({
    this.attributeSource,
    this.buyerAgent,
    this.date,
    this.event,
    this.postingIsRental,
    this.price,
    this.priceChangeRate,
    this.pricePerSquareFoot,
    this.sellerAgent,
    this.showCountyLink,
    this.source,
    this.time,
  });

  factory PriceHistory.fromRawJson(String str) => PriceHistory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PriceHistory.fromJson(Map<String, dynamic> json) => PriceHistory(
    attributeSource: json["attributeSource"] == null ? null : AttributeSource.fromJson(json["attributeSource"]),
    buyerAgent: json["buyerAgent"] == null ? null : ErAgent.fromJson(json["buyerAgent"]),
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    event: json["event"],
    postingIsRental: json["postingIsRental"],
    price: json["price"],
    priceChangeRate: json["priceChangeRate"]?.toDouble(),
    pricePerSquareFoot: json["pricePerSquareFoot"],
    sellerAgent: json["sellerAgent"] == null ? null : ErAgent.fromJson(json["sellerAgent"]),
    showCountyLink: json["showCountyLink"],
    source: json["source"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "attributeSource": attributeSource?.toJson(),
    "buyerAgent": buyerAgent?.toJson(),
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "event": event,
    "postingIsRental": postingIsRental,
    "price": price,
    "priceChangeRate": priceChangeRate,
    "pricePerSquareFoot": pricePerSquareFoot,
    "sellerAgent": sellerAgent?.toJson(),
    "showCountyLink": showCountyLink,
    "source": source,
    "time": time,
  };
}

class AttributeSource {
  String? infoString1;
  String? infoString2;
  String? infoString3;

  AttributeSource({
    this.infoString1,
    this.infoString2,
    this.infoString3,
  });

  factory AttributeSource.fromRawJson(String str) => AttributeSource.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AttributeSource.fromJson(Map<String, dynamic> json) => AttributeSource(
    infoString1: json["infoString1"],
    infoString2: json["infoString2"],
    infoString3: json["infoString3"],
  );

  Map<String, dynamic> toJson() => {
    "infoString1": infoString1,
    "infoString2": infoString2,
    "infoString3": infoString3,
  };
}

class ErAgent {
  String? name;
  MiniCardPhotoElement? photo;
  String? profileUrl;

  ErAgent({
    this.name,
    this.photo,
    this.profileUrl,
  });

  factory ErAgent.fromRawJson(String str) => ErAgent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ErAgent.fromJson(Map<String, dynamic> json) => ErAgent(
    name: json["name"],
    photo: json["photo"] == null ? null : MiniCardPhotoElement.fromJson(json["photo"]),
    profileUrl: json["profileUrl"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "photo": photo?.toJson(),
    "profileUrl": profileUrl,
  };
}

class ResoFacts {
  dynamic aboveGradeFinishedArea;
  dynamic accessibilityFeatures;
  dynamic additionalFeeInfo;
  dynamic additionalParcelsDescription;
  List<String>? appliances;
  dynamic architecturalStyle;
  dynamic associationAmenities;
  dynamic associationFee;
  dynamic associationFee2;
  dynamic associationFeeIncludes;
  dynamic associationName;
  dynamic associationName2;
  dynamic associationPhone;
  dynamic associationPhone2;
  List<AtAGlanceFact>? atAGlanceFacts;
  dynamic attic;
  dynamic availabilityDate;
  dynamic basement;
  bool? basementYn;
  int? bathrooms;
  dynamic bathroomsFull;
  dynamic bathroomsHalf;
  dynamic bathroomsOneQuarter;
  dynamic bathroomsPartial;
  dynamic bathroomsThreeQuarter;
  int? bedrooms;
  dynamic belowGradeFinishedArea;
  dynamic bodyType;
  dynamic builderModel;
  dynamic builderName;
  dynamic buildingArea;
  dynamic buildingAreaSource;
  dynamic buildingFeatures;
  dynamic buildingName;
  dynamic buyerAgencyCompensation;
  dynamic buyerAgencyCompensationType;
  bool? canRaiseHorses;
  dynamic carportParkingCapacity;
  String? cityRegion;
  dynamic commonWalls;
  List<dynamic>? communityFeatures;
  List<dynamic>? constructionMaterials;
  List<String>? cooling;
  dynamic coveredParkingCapacity;
  dynamic cropsIncludedYn;
  dynamic developmentStatus;
  dynamic doorFeatures;
  dynamic electric;
  dynamic elementarySchool;
  String? elementarySchoolDistrict;
  dynamic elevation;
  dynamic elevationUnits;
  dynamic entryLevel;
  dynamic entryLocation;
  dynamic exclusions;
  List<String>? exteriorFeatures;
  dynamic fencing;
  dynamic fireplaceFeatures;
  dynamic fireplaces;
  List<String>? flooring;
  dynamic foundationArea;
  List<dynamic>? foundationDetails;
  dynamic frontageLength;
  dynamic frontageType;
  bool? furnished;
  dynamic garageParkingCapacity;
  dynamic gas;
  dynamic greenBuildingVerificationType;
  dynamic greenEnergyEfficient;
  dynamic greenIndoorAirQuality;
  dynamic greenSustainability;
  dynamic greenWaterConservation;
  bool? hasAdditionalParcels;
  bool? hasAssociation;
  dynamic hasAttachedGarage;
  bool? hasAttachedProperty;
  dynamic hasCarport;
  bool? hasCooling;
  dynamic hasElectricOnProperty;
  bool? hasFireplace;
  bool? hasGarage;
  bool? hasHeating;
  bool? hasHomeWarranty;
  bool? hasLandLease;
  dynamic hasOpenParking;
  dynamic hasPetsAllowed;
  dynamic hasPrivatePool;
  dynamic hasRentControl;
  bool? hasSpa;
  bool? hasView;
  dynamic hasWaterfrontView;
  List<String>? heating;
  dynamic highSchool;
  String? highSchoolDistrict;
  String? hoaFee;
  String? homeType;
  dynamic horseAmenities;
  dynamic horseYn;
  dynamic inclusions;
  dynamic incomeIncludes;
  dynamic interiorFeatures;
  dynamic irrigationWaterRightsAcres;
  dynamic irrigationWaterRightsYn;
  dynamic isNewConstruction;
  dynamic isSeniorCommunity;
  dynamic landLeaseAmount;
  dynamic landLeaseExpirationDate;
  dynamic laundryFeatures;
  dynamic levels;
  dynamic listAor;
  dynamic listingId;
  dynamic listingTerms;
  String? livingArea;
  dynamic livingAreaRange;
  dynamic livingAreaRangeUnits;
  dynamic lotFeatures;
  String? lotSize;
  dynamic lotSizeDimensions;
  dynamic mainLevelBathrooms;
  dynamic mainLevelBedrooms;
  dynamic marketingType;
  dynamic middleOrJuniorSchool;
  String? middleOrJuniorSchoolDistrict;
  dynamic municipality;
  dynamic numberOfUnitsInCommunity;
  dynamic numberOfUnitsVacant;
  dynamic offerReviewDate;
  dynamic onMarketDate;
  dynamic openParkingCapacity;
  dynamic otherEquipment;
  List<dynamic>? otherFacts;
  dynamic otherParking;
  dynamic otherStructures;
  dynamic ownership;
  dynamic ownershipType;
  String? parcelNumber;
  int? parkingCapacity;
  List<String>? parkingFeatures;
  dynamic patioAndPorchFeatures;
  dynamic poolFeatures;
  int? pricePerSquareFoot;
  dynamic propertyCondition;
  dynamic propertySubType;
  dynamic roadSurfaceType;
  String? roofType;
  dynamic securityFeatures;
  dynamic sewer;
  dynamic spaFeatures;
  dynamic specialListingConditions;
  dynamic stories;
  dynamic storiesTotal;
  String? structureType;
  dynamic subdivisionName;
  int? taxAnnualAmount;
  dynamic topography;
  dynamic totalActualRent;
  dynamic utilities;
  dynamic vegetation;
  List<dynamic>? view;
  dynamic virtualTour;
  dynamic waterBodyName;
  dynamic waterSource;
  String? waterView;
  dynamic waterViewYn;
  dynamic waterfrontFeatures;
  dynamic windowFeatures;
  dynamic woodedArea;
  int? yearBuilt;
  dynamic yearBuiltEffective;
  dynamic zoning;
  dynamic zoningDescription;

  ResoFacts({
    this.aboveGradeFinishedArea,
    this.accessibilityFeatures,
    this.additionalFeeInfo,
    this.additionalParcelsDescription,
    this.appliances,
    this.architecturalStyle,
    this.associationAmenities,
    this.associationFee,
    this.associationFee2,
    this.associationFeeIncludes,
    this.associationName,
    this.associationName2,
    this.associationPhone,
    this.associationPhone2,
    this.atAGlanceFacts,
    this.attic,
    this.availabilityDate,
    this.basement,
    this.basementYn,
    this.bathrooms,
    this.bathroomsFull,
    this.bathroomsHalf,
    this.bathroomsOneQuarter,
    this.bathroomsPartial,
    this.bathroomsThreeQuarter,
    this.bedrooms,
    this.belowGradeFinishedArea,
    this.bodyType,
    this.builderModel,
    this.builderName,
    this.buildingArea,
    this.buildingAreaSource,
    this.buildingFeatures,
    this.buildingName,
    this.buyerAgencyCompensation,
    this.buyerAgencyCompensationType,
    this.canRaiseHorses,
    this.carportParkingCapacity,
    this.cityRegion,
    this.commonWalls,
    this.communityFeatures,
    this.constructionMaterials,
    this.cooling,
    this.coveredParkingCapacity,
    this.cropsIncludedYn,
    this.developmentStatus,
    this.doorFeatures,
    this.electric,
    this.elementarySchool,
    this.elementarySchoolDistrict,
    this.elevation,
    this.elevationUnits,
    this.entryLevel,
    this.entryLocation,
    this.exclusions,
    this.exteriorFeatures,
    this.fencing,
    this.fireplaceFeatures,
    this.fireplaces,
    this.flooring,
    this.foundationArea,
    this.foundationDetails,
    this.frontageLength,
    this.frontageType,
    this.furnished,
    this.garageParkingCapacity,
    this.gas,
    this.greenBuildingVerificationType,
    this.greenEnergyEfficient,
    this.greenIndoorAirQuality,
    this.greenSustainability,
    this.greenWaterConservation,
    this.hasAdditionalParcels,
    this.hasAssociation,
    this.hasAttachedGarage,
    this.hasAttachedProperty,
    this.hasCarport,
    this.hasCooling,
    this.hasElectricOnProperty,
    this.hasFireplace,
    this.hasGarage,
    this.hasHeating,
    this.hasHomeWarranty,
    this.hasLandLease,
    this.hasOpenParking,
    this.hasPetsAllowed,
    this.hasPrivatePool,
    this.hasRentControl,
    this.hasSpa,
    this.hasView,
    this.hasWaterfrontView,
    this.heating,
    this.highSchool,
    this.highSchoolDistrict,
    this.hoaFee,
    this.homeType,
    this.horseAmenities,
    this.horseYn,
    this.inclusions,
    this.incomeIncludes,
    this.interiorFeatures,
    this.irrigationWaterRightsAcres,
    this.irrigationWaterRightsYn,
    this.isNewConstruction,
    this.isSeniorCommunity,
    this.landLeaseAmount,
    this.landLeaseExpirationDate,
    this.laundryFeatures,
    this.levels,
    this.listAor,
    this.listingId,
    this.listingTerms,
    this.livingArea,
    this.livingAreaRange,
    this.livingAreaRangeUnits,
    this.lotFeatures,
    this.lotSize,
    this.lotSizeDimensions,
    this.mainLevelBathrooms,
    this.mainLevelBedrooms,
    this.marketingType,
    this.middleOrJuniorSchool,
    this.middleOrJuniorSchoolDistrict,
    this.municipality,
    this.numberOfUnitsInCommunity,
    this.numberOfUnitsVacant,
    this.offerReviewDate,
    this.onMarketDate,
    this.openParkingCapacity,
    this.otherEquipment,
    this.otherFacts,
    this.otherParking,
    this.otherStructures,
    this.ownership,
    this.ownershipType,
    this.parcelNumber,
    this.parkingCapacity,
    this.parkingFeatures,
    this.patioAndPorchFeatures,
    this.poolFeatures,
    this.pricePerSquareFoot,
    this.propertyCondition,
    this.propertySubType,
    this.roadSurfaceType,
    this.roofType,
    this.securityFeatures,
    this.sewer,
    this.spaFeatures,
    this.specialListingConditions,
    this.stories,
    this.storiesTotal,
    this.structureType,
    this.subdivisionName,
    this.taxAnnualAmount,
    this.topography,
    this.totalActualRent,
    this.utilities,
    this.vegetation,
    this.view,
    this.virtualTour,
    this.waterBodyName,
    this.waterSource,
    this.waterView,
    this.waterViewYn,
    this.waterfrontFeatures,
    this.windowFeatures,
    this.woodedArea,
    this.yearBuilt,
    this.yearBuiltEffective,
    this.zoning,
    this.zoningDescription,
  });

  factory ResoFacts.fromRawJson(String str) => ResoFacts.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResoFacts.fromJson(Map<String, dynamic> json) => ResoFacts(
    aboveGradeFinishedArea: json["aboveGradeFinishedArea"],
    accessibilityFeatures: json["accessibilityFeatures"],
    additionalFeeInfo: json["additionalFeeInfo"],
    additionalParcelsDescription: json["additionalParcelsDescription"],
    appliances: json["appliances"] == null ? [] : List<String>.from(json["appliances"]!.map((x) => x)),
    architecturalStyle: json["architecturalStyle"],
    associationAmenities: json["associationAmenities"],
    associationFee: json["associationFee"],
    associationFee2: json["associationFee2"],
    associationFeeIncludes: json["associationFeeIncludes"],
    associationName: json["associationName"],
    associationName2: json["associationName2"],
    associationPhone: json["associationPhone"],
    associationPhone2: json["associationPhone2"],
    atAGlanceFacts: json["atAGlanceFacts"] == null ? [] : List<AtAGlanceFact>.from(json["atAGlanceFacts"]!.map((x) => AtAGlanceFact.fromJson(x))),
    attic: json["attic"],
    availabilityDate: json["availabilityDate"],
    basement: json["basement"],
    basementYn: json["basementYN"],
    bathrooms: json["bathrooms"],
    bathroomsFull: json["bathroomsFull"],
    bathroomsHalf: json["bathroomsHalf"],
    bathroomsOneQuarter: json["bathroomsOneQuarter"],
    bathroomsPartial: json["bathroomsPartial"],
    bathroomsThreeQuarter: json["bathroomsThreeQuarter"],
    bedrooms: json["bedrooms"],
    belowGradeFinishedArea: json["belowGradeFinishedArea"],
    bodyType: json["bodyType"],
    builderModel: json["builderModel"],
    builderName: json["builderName"],
    buildingArea: json["buildingArea"],
    buildingAreaSource: json["buildingAreaSource"],
    buildingFeatures: json["buildingFeatures"],
    buildingName: json["buildingName"],
    buyerAgencyCompensation: json["buyerAgencyCompensation"],
    buyerAgencyCompensationType: json["buyerAgencyCompensationType"],
    canRaiseHorses: json["canRaiseHorses"],
    carportParkingCapacity: json["carportParkingCapacity"],
    cityRegion: json["cityRegion"],
    commonWalls: json["commonWalls"],
    communityFeatures: json["communityFeatures"] == null ? [] : List<dynamic>.from(json["communityFeatures"]!.map((x) => x)),
    constructionMaterials: json["constructionMaterials"] == null ? [] : List<dynamic>.from(json["constructionMaterials"]!.map((x) => x)),
    cooling: json["cooling"] == null ? [] : List<String>.from(json["cooling"]!.map((x) => x)),
    coveredParkingCapacity: json["coveredParkingCapacity"],
    cropsIncludedYn: json["cropsIncludedYN"],
    developmentStatus: json["developmentStatus"],
    doorFeatures: json["doorFeatures"],
    electric: json["electric"],
    elementarySchool: json["elementarySchool"],
    elementarySchoolDistrict: json["elementarySchoolDistrict"],
    elevation: json["elevation"],
    elevationUnits: json["elevationUnits"],
    entryLevel: json["entryLevel"],
    entryLocation: json["entryLocation"],
    exclusions: json["exclusions"],
    exteriorFeatures: json["exteriorFeatures"] == null ? [] : List<String>.from(json["exteriorFeatures"]!.map((x) => x)),
    fencing: json["fencing"],
    fireplaceFeatures: json["fireplaceFeatures"],
    fireplaces: json["fireplaces"],
    flooring: json["flooring"] == null ? [] : List<String>.from(json["flooring"]!.map((x) => x)),
    foundationArea: json["foundationArea"],
    foundationDetails: json["foundationDetails"] == null ? [] : List<dynamic>.from(json["foundationDetails"]!.map((x) => x)),
    frontageLength: json["frontageLength"],
    frontageType: json["frontageType"],
    furnished: json["furnished"],
    garageParkingCapacity: json["garageParkingCapacity"],
    gas: json["gas"],
    greenBuildingVerificationType: json["greenBuildingVerificationType"],
    greenEnergyEfficient: json["greenEnergyEfficient"],
    greenIndoorAirQuality: json["greenIndoorAirQuality"],
    greenSustainability: json["greenSustainability"],
    greenWaterConservation: json["greenWaterConservation"],
    hasAdditionalParcels: json["hasAdditionalParcels"],
    hasAssociation: json["hasAssociation"],
    hasAttachedGarage: json["hasAttachedGarage"],
    hasAttachedProperty: json["hasAttachedProperty"],
    hasCarport: json["hasCarport"],
    hasCooling: json["hasCooling"],
    hasElectricOnProperty: json["hasElectricOnProperty"],
    hasFireplace: json["hasFireplace"],
    hasGarage: json["hasGarage"],
    hasHeating: json["hasHeating"],
    hasHomeWarranty: json["hasHomeWarranty"],
    hasLandLease: json["hasLandLease"],
    hasOpenParking: json["hasOpenParking"],
    hasPetsAllowed: json["hasPetsAllowed"],
    hasPrivatePool: json["hasPrivatePool"],
    hasRentControl: json["hasRentControl"],
    hasSpa: json["hasSpa"],
    hasView: json["hasView"],
    hasWaterfrontView: json["hasWaterfrontView"],
    heating: json["heating"] == null ? [] : List<String>.from(json["heating"]!.map((x) => x)),
    highSchool: json["highSchool"],
    highSchoolDistrict: json["highSchoolDistrict"],
    hoaFee: json["hoaFee"],
    homeType: json["homeType"],
    horseAmenities: json["horseAmenities"],
    horseYn: json["horseYN"],
    inclusions: json["inclusions"],
    incomeIncludes: json["incomeIncludes"],
    interiorFeatures: json["interiorFeatures"],
    irrigationWaterRightsAcres: json["irrigationWaterRightsAcres"],
    irrigationWaterRightsYn: json["irrigationWaterRightsYN"],
    isNewConstruction: json["isNewConstruction"],
    isSeniorCommunity: json["isSeniorCommunity"],
    landLeaseAmount: json["landLeaseAmount"],
    landLeaseExpirationDate: json["landLeaseExpirationDate"],
    laundryFeatures: json["laundryFeatures"],
    levels: json["levels"],
    listAor: json["listAOR"],
    listingId: json["listingId"],
    listingTerms: json["listingTerms"],
    livingArea: json["livingArea"],
    livingAreaRange: json["livingAreaRange"],
    livingAreaRangeUnits: json["livingAreaRangeUnits"],
    lotFeatures: json["lotFeatures"],
    lotSize: json["lotSize"],
    lotSizeDimensions: json["lotSizeDimensions"],
    mainLevelBathrooms: json["mainLevelBathrooms"],
    mainLevelBedrooms: json["mainLevelBedrooms"],
    marketingType: json["marketingType"],
    middleOrJuniorSchool: json["middleOrJuniorSchool"],
    middleOrJuniorSchoolDistrict: json["middleOrJuniorSchoolDistrict"],
    municipality: json["municipality"],
    numberOfUnitsInCommunity: json["numberOfUnitsInCommunity"],
    numberOfUnitsVacant: json["numberOfUnitsVacant"],
    offerReviewDate: json["offerReviewDate"],
    onMarketDate: json["onMarketDate"],
    openParkingCapacity: json["openParkingCapacity"],
    otherEquipment: json["otherEquipment"],
    otherFacts: json["otherFacts"] == null ? [] : List<dynamic>.from(json["otherFacts"]!.map((x) => x)),
    otherParking: json["otherParking"],
    otherStructures: json["otherStructures"],
    ownership: json["ownership"],
    ownershipType: json["ownershipType"],
    parcelNumber: json["parcelNumber"],
    parkingCapacity: json["parkingCapacity"],
    parkingFeatures: json["parkingFeatures"] == null ? [] : List<String>.from(json["parkingFeatures"]!.map((x) => x)),
    patioAndPorchFeatures: json["patioAndPorchFeatures"],
    poolFeatures: json["poolFeatures"],
    pricePerSquareFoot: json["pricePerSquareFoot"],
    propertyCondition: json["propertyCondition"],
    propertySubType: json["propertySubType"],
    roadSurfaceType: json["roadSurfaceType"],
    roofType: json["roofType"],
    securityFeatures: json["securityFeatures"],
    sewer: json["sewer"],
    spaFeatures: json["spaFeatures"],
    specialListingConditions: json["specialListingConditions"],
    stories: json["stories"],
    storiesTotal: json["storiesTotal"],
    structureType: json["structureType"],
    subdivisionName: json["subdivisionName"],
    taxAnnualAmount: json["taxAnnualAmount"],
    topography: json["topography"],
    totalActualRent: json["totalActualRent"],
    utilities: json["utilities"],
    vegetation: json["vegetation"],
    view: json["view"] == null ? [] : List<dynamic>.from(json["view"]!.map((x) => x)),
    virtualTour: json["virtualTour"],
    waterBodyName: json["waterBodyName"],
    waterSource: json["waterSource"],
    waterView: json["waterView"],
    waterViewYn: json["waterViewYN"],
    waterfrontFeatures: json["waterfrontFeatures"],
    windowFeatures: json["windowFeatures"],
    woodedArea: json["woodedArea"],
    yearBuilt: json["yearBuilt"],
    yearBuiltEffective: json["yearBuiltEffective"],
    zoning: json["zoning"],
    zoningDescription: json["zoningDescription"],
  );

  Map<String, dynamic> toJson() => {
    "aboveGradeFinishedArea": aboveGradeFinishedArea,
    "accessibilityFeatures": accessibilityFeatures,
    "additionalFeeInfo": additionalFeeInfo,
    "additionalParcelsDescription": additionalParcelsDescription,
    "appliances": appliances == null ? [] : List<dynamic>.from(appliances!.map((x) => x)),
    "architecturalStyle": architecturalStyle,
    "associationAmenities": associationAmenities,
    "associationFee": associationFee,
    "associationFee2": associationFee2,
    "associationFeeIncludes": associationFeeIncludes,
    "associationName": associationName,
    "associationName2": associationName2,
    "associationPhone": associationPhone,
    "associationPhone2": associationPhone2,
    "atAGlanceFacts": atAGlanceFacts == null ? [] : List<dynamic>.from(atAGlanceFacts!.map((x) => x.toJson())),
    "attic": attic,
    "availabilityDate": availabilityDate,
    "basement": basement,
    "basementYN": basementYn,
    "bathrooms": bathrooms,
    "bathroomsFull": bathroomsFull,
    "bathroomsHalf": bathroomsHalf,
    "bathroomsOneQuarter": bathroomsOneQuarter,
    "bathroomsPartial": bathroomsPartial,
    "bathroomsThreeQuarter": bathroomsThreeQuarter,
    "bedrooms": bedrooms,
    "belowGradeFinishedArea": belowGradeFinishedArea,
    "bodyType": bodyType,
    "builderModel": builderModel,
    "builderName": builderName,
    "buildingArea": buildingArea,
    "buildingAreaSource": buildingAreaSource,
    "buildingFeatures": buildingFeatures,
    "buildingName": buildingName,
    "buyerAgencyCompensation": buyerAgencyCompensation,
    "buyerAgencyCompensationType": buyerAgencyCompensationType,
    "canRaiseHorses": canRaiseHorses,
    "carportParkingCapacity": carportParkingCapacity,
    "cityRegion": cityRegion,
    "commonWalls": commonWalls,
    "communityFeatures": communityFeatures == null ? [] : List<dynamic>.from(communityFeatures!.map((x) => x)),
    "constructionMaterials": constructionMaterials == null ? [] : List<dynamic>.from(constructionMaterials!.map((x) => x)),
    "cooling": cooling == null ? [] : List<dynamic>.from(cooling!.map((x) => x)),
    "coveredParkingCapacity": coveredParkingCapacity,
    "cropsIncludedYN": cropsIncludedYn,
    "developmentStatus": developmentStatus,
    "doorFeatures": doorFeatures,
    "electric": electric,
    "elementarySchool": elementarySchool,
    "elementarySchoolDistrict": elementarySchoolDistrict,
    "elevation": elevation,
    "elevationUnits": elevationUnits,
    "entryLevel": entryLevel,
    "entryLocation": entryLocation,
    "exclusions": exclusions,
    "exteriorFeatures": exteriorFeatures == null ? [] : List<dynamic>.from(exteriorFeatures!.map((x) => x)),
    "fencing": fencing,
    "fireplaceFeatures": fireplaceFeatures,
    "fireplaces": fireplaces,
    "flooring": flooring == null ? [] : List<dynamic>.from(flooring!.map((x) => x)),
    "foundationArea": foundationArea,
    "foundationDetails": foundationDetails == null ? [] : List<dynamic>.from(foundationDetails!.map((x) => x)),
    "frontageLength": frontageLength,
    "frontageType": frontageType,
    "furnished": furnished,
    "garageParkingCapacity": garageParkingCapacity,
    "gas": gas,
    "greenBuildingVerificationType": greenBuildingVerificationType,
    "greenEnergyEfficient": greenEnergyEfficient,
    "greenIndoorAirQuality": greenIndoorAirQuality,
    "greenSustainability": greenSustainability,
    "greenWaterConservation": greenWaterConservation,
    "hasAdditionalParcels": hasAdditionalParcels,
    "hasAssociation": hasAssociation,
    "hasAttachedGarage": hasAttachedGarage,
    "hasAttachedProperty": hasAttachedProperty,
    "hasCarport": hasCarport,
    "hasCooling": hasCooling,
    "hasElectricOnProperty": hasElectricOnProperty,
    "hasFireplace": hasFireplace,
    "hasGarage": hasGarage,
    "hasHeating": hasHeating,
    "hasHomeWarranty": hasHomeWarranty,
    "hasLandLease": hasLandLease,
    "hasOpenParking": hasOpenParking,
    "hasPetsAllowed": hasPetsAllowed,
    "hasPrivatePool": hasPrivatePool,
    "hasRentControl": hasRentControl,
    "hasSpa": hasSpa,
    "hasView": hasView,
    "hasWaterfrontView": hasWaterfrontView,
    "heating": heating == null ? [] : List<dynamic>.from(heating!.map((x) => x)),
    "highSchool": highSchool,
    "highSchoolDistrict": highSchoolDistrict,
    "hoaFee": hoaFee,
    "homeType": homeType,
    "horseAmenities": horseAmenities,
    "horseYN": horseYn,
    "inclusions": inclusions,
    "incomeIncludes": incomeIncludes,
    "interiorFeatures": interiorFeatures,
    "irrigationWaterRightsAcres": irrigationWaterRightsAcres,
    "irrigationWaterRightsYN": irrigationWaterRightsYn,
    "isNewConstruction": isNewConstruction,
    "isSeniorCommunity": isSeniorCommunity,
    "landLeaseAmount": landLeaseAmount,
    "landLeaseExpirationDate": landLeaseExpirationDate,
    "laundryFeatures": laundryFeatures,
    "levels": levels,
    "listAOR": listAor,
    "listingId": listingId,
    "listingTerms": listingTerms,
    "livingArea": livingArea,
    "livingAreaRange": livingAreaRange,
    "livingAreaRangeUnits": livingAreaRangeUnits,
    "lotFeatures": lotFeatures,
    "lotSize": lotSize,
    "lotSizeDimensions": lotSizeDimensions,
    "mainLevelBathrooms": mainLevelBathrooms,
    "mainLevelBedrooms": mainLevelBedrooms,
    "marketingType": marketingType,
    "middleOrJuniorSchool": middleOrJuniorSchool,
    "middleOrJuniorSchoolDistrict": middleOrJuniorSchoolDistrict,
    "municipality": municipality,
    "numberOfUnitsInCommunity": numberOfUnitsInCommunity,
    "numberOfUnitsVacant": numberOfUnitsVacant,
    "offerReviewDate": offerReviewDate,
    "onMarketDate": onMarketDate,
    "openParkingCapacity": openParkingCapacity,
    "otherEquipment": otherEquipment,
    "otherFacts": otherFacts == null ? [] : List<dynamic>.from(otherFacts!.map((x) => x)),
    "otherParking": otherParking,
    "otherStructures": otherStructures,
    "ownership": ownership,
    "ownershipType": ownershipType,
    "parcelNumber": parcelNumber,
    "parkingCapacity": parkingCapacity,
    "parkingFeatures": parkingFeatures == null ? [] : List<dynamic>.from(parkingFeatures!.map((x) => x)),
    "patioAndPorchFeatures": patioAndPorchFeatures,
    "poolFeatures": poolFeatures,
    "pricePerSquareFoot": pricePerSquareFoot,
    "propertyCondition": propertyCondition,
    "propertySubType": propertySubType,
    "roadSurfaceType": roadSurfaceType,
    "roofType": roofType,
    "securityFeatures": securityFeatures,
    "sewer": sewer,
    "spaFeatures": spaFeatures,
    "specialListingConditions": specialListingConditions,
    "stories": stories,
    "storiesTotal": storiesTotal,
    "structureType": structureType,
    "subdivisionName": subdivisionName,
    "taxAnnualAmount": taxAnnualAmount,
    "topography": topography,
    "totalActualRent": totalActualRent,
    "utilities": utilities,
    "vegetation": vegetation,
    "view": view == null ? [] : List<dynamic>.from(view!.map((x) => x)),
    "virtualTour": virtualTour,
    "waterBodyName": waterBodyName,
    "waterSource": waterSource,
    "waterView": waterView,
    "waterViewYN": waterViewYn,
    "waterfrontFeatures": waterfrontFeatures,
    "windowFeatures": windowFeatures,
    "woodedArea": woodedArea,
    "yearBuilt": yearBuilt,
    "yearBuiltEffective": yearBuiltEffective,
    "zoning": zoning,
    "zoningDescription": zoningDescription,
  };
}

class AtAGlanceFact {
  String? factLabel;
  String? factValue;

  AtAGlanceFact({
    this.factLabel,
    this.factValue,
  });

  factory AtAGlanceFact.fromRawJson(String str) => AtAGlanceFact.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AtAGlanceFact.fromJson(Map<String, dynamic> json) => AtAGlanceFact(
    factLabel: json["factLabel"],
    factValue: json["factValue"],
  );

  Map<String, dynamic> toJson() => {
    "factLabel": factLabel,
    "factValue": factValue,
  };
}

class ResponsivePhoto {
  String? caption;
  dynamic mixedSources;
  dynamic subjectType;
  String? url;

  ResponsivePhoto({
    this.caption,
    this.mixedSources,
    this.subjectType,
    this.url,
  });

  factory ResponsivePhoto.fromRawJson(String str) => ResponsivePhoto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponsivePhoto.fromJson(Map<String, dynamic> json) => ResponsivePhoto(
    caption: json["caption"],
    mixedSources: json["mixedSources"],
    subjectType: json["subjectType"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "caption": caption,
    "mixedSources": mixedSources,
    "subjectType": subjectType,
    "url": url,
  };
}

class School {
  dynamic assigned;
  double? distance;
  String? grades;
  dynamic isAssigned;
  String? level;
  String? link;
  String? name;
  int? rating;
  dynamic size;
  dynamic studentsPerTeacher;
  dynamic totalCount;
  String? type;

  School({
    this.assigned,
    this.distance,
    this.grades,
    this.isAssigned,
    this.level,
    this.link,
    this.name,
    this.rating,
    this.size,
    this.studentsPerTeacher,
    this.totalCount,
    this.type,
  });

  factory School.fromRawJson(String str) => School.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory School.fromJson(Map<String, dynamic> json) => School(
    assigned: json["assigned"],
    distance: json["distance"]?.toDouble(),
    grades: json["grades"],
    isAssigned: json["isAssigned"],
    level: json["level"],
    link: json["link"],
    name: json["name"],
    rating: json["rating"],
    size: json["size"],
    studentsPerTeacher: json["studentsPerTeacher"],
    totalCount: json["totalCount"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "assigned": assigned,
    "distance": distance,
    "grades": grades,
    "isAssigned": isAssigned,
    "level": level,
    "link": link,
    "name": name,
    "rating": rating,
    "size": size,
    "studentsPerTeacher": studentsPerTeacher,
    "totalCount": totalCount,
    "type": type,
  };
}

class StaticMap {
  List<Source>? sources;

  StaticMap({
    this.sources,
  });

  factory StaticMap.fromRawJson(String str) => StaticMap.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StaticMap.fromJson(Map<String, dynamic> json) => StaticMap(
    sources: json["sources"] == null ? [] : List<Source>.from(json["sources"]!.map((x) => Source.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sources": sources == null ? [] : List<dynamic>.from(sources!.map((x) => x.toJson())),
  };
}

class TaxHistory {
  double? taxIncreaseRate;
  double? taxPaid;
  int? time;
  int? value;
  double? valueIncreaseRate;

  TaxHistory({
    this.taxIncreaseRate,
    this.taxPaid,
    this.time,
    this.value,
    this.valueIncreaseRate,
  });

  factory TaxHistory.fromRawJson(String str) => TaxHistory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TaxHistory.fromJson(Map<String, dynamic> json) => TaxHistory(
    taxIncreaseRate: json["taxIncreaseRate"]?.toDouble(),
    taxPaid: json["taxPaid"]?.toDouble(),
    time: json["time"],
    value: json["value"],
    valueIncreaseRate: json["valueIncreaseRate"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "taxIncreaseRate": taxIncreaseRate,
    "taxPaid": taxPaid,
    "time": time,
    "value": value,
    "valueIncreaseRate": valueIncreaseRate,
  };
}

class TourEligibility {
  bool? isPropertyTourEligible;
  PropertyTourOptions? propertyTourOptions;

  TourEligibility({
    this.isPropertyTourEligible,
    this.propertyTourOptions,
  });

  factory TourEligibility.fromRawJson(String str) => TourEligibility.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TourEligibility.fromJson(Map<String, dynamic> json) => TourEligibility(
    isPropertyTourEligible: json["isPropertyTourEligible"],
    propertyTourOptions: json["propertyTourOptions"] == null ? null : PropertyTourOptions.fromJson(json["propertyTourOptions"]),
  );

  Map<String, dynamic> toJson() => {
    "isPropertyTourEligible": isPropertyTourEligible,
    "propertyTourOptions": propertyTourOptions?.toJson(),
  };
}

class PropertyTourOptions {
  bool? isFinal;
  List<dynamic>? tourAvailability;
  String? tourType;

  PropertyTourOptions({
    this.isFinal,
    this.tourAvailability,
    this.tourType,
  });

  factory PropertyTourOptions.fromRawJson(String str) => PropertyTourOptions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PropertyTourOptions.fromJson(Map<String, dynamic> json) => PropertyTourOptions(
    isFinal: json["isFinal"],
    tourAvailability: json["tourAvailability"] == null ? [] : List<dynamic>.from(json["tourAvailability"]!.map((x) => x)),
    tourType: json["tourType"],
  );

  Map<String, dynamic> toJson() => {
    "isFinal": isFinal,
    "tourAvailability": tourAvailability == null ? [] : List<dynamic>.from(tourAvailability!.map((x) => x)),
    "tourType": tourType,
  };
}

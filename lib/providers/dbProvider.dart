import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:remax_geeks/models/sellNowFormModel.dart';


class DBProvider extends ChangeNotifier{

  late final FirebaseDatabase _database;


  //REFERENCE TO THE DATABASE
  DatabaseReference? _databaseReference;
  //GETTING THE NUMBER OF COSTUMERS
  late int _numberOfCostumers;
  //GETTING PREMIUM SERVICES TITLES AND DESCRIPTIONS
  late List<String> pTitles;
  late List<String> pDescriptions;
  late String? pFullServiceIncludes = '';
  //GETTING CUSTOM SERVICES TITLES AND DESCRIPTIONS
  late List<String> cTitles;
  late List<String> cDescriptions;
  late String? cCustomIncludes = '';

  //CONSTRUCTOR
  DBProvider(){
    //INITIALIZE FIREBASE REALTIME
    _database = FirebaseDatabase.instance;
    _databaseReference = _database.ref();
  }

  //GETTERS
  DatabaseReference? get databaseReference => _databaseReference;

  //SETTERS
  //SET THE SELLING FORM DATA, AS A JSON OBJECT, TO THE DATABASE
  Future<void> setSellingFormData( Map<String, dynamic> sellingFormData) async{
    //ADD THE NUMBER OF COSTUMERS TO THE KEY
    String costumer = _numberOfCostumers.toString();
    await _databaseReference!.child('SELLING_FORM' + costumer).set(sellingFormData);
    notifyListeners();
  }
  //NUMBER OF COSTUMERS, GET THE NUMBER OF COSTUMERS FROM THE DATABASE AS INT
  Future<void> getNumberOfCostumers() async{
    final snapshot = await _databaseReference!.child('COSTUMERS').get();
    final numberOfCostumers = snapshot.value as int;
    _numberOfCostumers = numberOfCostumers;
    notifyListeners();
  }

  //NUMBER OF COSTUMERS, INCREMENT THE NUMBER OF COSTUMERS IN THE DATABASE
  Future<void> incrementNumberOfCostumers() async{
    _numberOfCostumers++;
    await _databaseReference!.child('COSTUMERS').set(_numberOfCostumers);
    notifyListeners();
  }

  //GET PREMIUM SERVICES TITLES
  Future<List<String>> getPremiumServicesTitles() async{
    final snapshot = await _databaseReference!.child('PREMIUM_SERVICES_TITLES').get();
    List<dynamic> premiumServicesTitles = snapshot.value as List<dynamic>;
    this.pTitles = premiumServicesTitles.map((e) => e.toString()).toList();
    notifyListeners();
    return pTitles;

  }

  //GET FULL SERVICE DESCRIPTION
  Future<String?> getFullServiceIncludes() async{
    final snapshot = await _databaseReference!.child('FULL_SERVICE_INCLUDES').get();
    final fullServiceIncludes = snapshot.value as String;
    this.pFullServiceIncludes = fullServiceIncludes;
    notifyListeners();
    return pFullServiceIncludes;
  }

  //GET PREMIUM SERVICES DESCRIPTIONS
  Future<List<String>> getPremiumServicesDescriptions() async{
    final snapshot = await _databaseReference!.child('PREMIUM_SERVICES_DESCRIPTIONS').get();
    List<dynamic> premiumServicesDescriptions = snapshot.value as List<dynamic>;
    this.pDescriptions = premiumServicesDescriptions.map((e) => e.toString()).toList();
    notifyListeners();
    return pDescriptions;
  }


  //GET CUSTOM SERVICES TITLES
  Future<List<String>> getCustomServicesTitles() async{
    final snapshot = await _databaseReference!.child('CUSTOM_SERVICES_TITLES').get();
    List<dynamic> customServicesTitles = snapshot.value as List<dynamic>;
    this.cTitles = customServicesTitles.map((e) => e.toString()).toList();
    notifyListeners();
    return cTitles;
  }

  //GET CUSTOM SERVICES DESCRIPTIONS
  Future<List<String>> getCustomServicesDescriptions() async{
    final snapshot = await _databaseReference!.child('CUSTOM_SERVICES_DESCRIPTIONS').get();
    List<dynamic> customServicesDescriptions = snapshot.value as List<dynamic>;
    this.cDescriptions = customServicesDescriptions.map((e) => e.toString()).toList();
    notifyListeners();
    return cDescriptions;
  }

  //GET CUSTOM SERVICES INCLUDES
  Future<String?> getCustomServicesIncludes() async{
    final snapshot = await _databaseReference!.child('CUSTOM_SERVICE_INCLUDES').get();
    final customServicesIncludes = snapshot.value as String;
    this.cCustomIncludes = customServicesIncludes;
    notifyListeners();
    return cCustomIncludes;
  }

  //GET TITLES AND DESCRIPTIONS FOR SERVICES
  Future<void> getTitlesAndDescriptions() async{
    //CUSTOM
    getCustomServicesTitles();
    getCustomServicesDescriptions();
    getCustomServicesIncludes();
    //PREMIUM
    getPremiumServicesTitles();
    getPremiumServicesDescriptions();
    getFullServiceIncludes();
  }





}
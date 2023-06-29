import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:remax_geeks/models/article.dart';
import 'package:remax_geeks/models/sellNowFormModel.dart';


class DBProvider extends ChangeNotifier{

  late final FirebaseDatabase _database;


  //REFERENCE TO THE DATABASE
  DatabaseReference? _databaseReference;
  //GETTING THE NUMBER OF COSTUMERS
  late int _numberOfCostumers;
  late int _numberOfSellForms;
  late int _numberOfArticles;
  //GETTIN THE PHONE NUMBER WHEN LOGGING IN
  late String phoneNumber = '';
  //GETTING PREMIUM SERVICES TITLES AND DESCRIPTIONS
  late List<String> pTitles;
  late List<String> pDescriptions;
  late String? pFullServiceIncludes = '';
  //GETTING CUSTOM SERVICES TITLES AND DESCRIPTIONS
  late List<String> cTitles;
  late List<String> cDescriptions;
  late String? cCustomIncludes = '';
  //GETTING THE ARTICLES
  late List<Article> articles = [];

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
    String sellForm = _numberOfSellForms.toString();
    await _databaseReference!.child('SELLING_FORMS').child('SELLING_FORM_' + sellForm).set(sellingFormData);
    incrementNumberOfSellForms();
    notifyListeners();
  }

  //NUMBER OF SELL FORMS, GET THE NUMBER OF COSTUMERS FROM THE DATABASE AS INT
  Future<void> getNumberOfSellingForms() async{
    final snapshot = await _databaseReference!.child('SELLING_FORMS_COUNT').get();
    final numberOfSellForms = snapshot.value as int;
    _numberOfSellForms = numberOfSellForms;
    notifyListeners();
  }

  //NUMBER OF COSTUMERS, INCREMENT THE NUMBER OF COSTUMERS IN THE DATABASE
  Future<void> incrementNumberOfSellForms() async{
    _numberOfSellForms++;
    await _databaseReference!.child('SELLING_FORMS_COUNT').set(_numberOfSellForms);
    notifyListeners();
  }


  //NUMBER OF COSTUMERS, GET THE NUMBER OF COSTUMERS FROM THE DATABASE AS INT
  Future<void> getNumberOfCostumers() async{
    final snapshot = await _databaseReference!.child('COSTUMERS_COUNT').get();
    final numberOfCostumers = snapshot.value as int;
    _numberOfCostumers = numberOfCostumers;
    notifyListeners();
  }

  //NUMBER OF COSTUMERS, INCREMENT THE NUMBER OF COSTUMERS IN THE DATABASE
  Future<void> incrementNumberOfCostumers() async{
    _numberOfCostumers++;
    await _databaseReference!.child('COSTUMERS_COUNT').set(_numberOfCostumers);
    notifyListeners();
  }

  //SET NEW COSTUMER TO THE DATABASE
  Future<void> setNewCostumer(Map<String, dynamic> costumer) async{
    await _databaseReference!.child('ALL_COSTUMERS').child('COSTUMER_' + _numberOfCostumers.toString()).set(costumer);
    incrementNumberOfCostumers();
    notifyListeners();
  }

  Future<String?> getPhoneNumberByUID(String uid) async {
    phoneNumber = '';
    int numberOfCostumers = _numberOfCostumers;
    for(int i = 0 ; i <= numberOfCostumers; i++){
      final snapshot = await _databaseReference!
          .child('ALL_COSTUMERS')
          .child('COSTUMER_' + i.toString())
          .get();

      final customer = snapshot.value as Map<dynamic, dynamic>?;

      if (customer != null) {
        String uidFounded = (customer['UID'] as String?)!;
        if (uidFounded == uid) this.phoneNumber = (customer['PHONE_NUMBER'] as String?)!;

      }
    }
    return phoneNumber;
  }
  //NUMBER OF COSTUMERS, GET THE NUMBER OF COSTUMERS FROM THE DATABASE AS INT
  Future<void> getNumberOfArticles() async{
    final snapshot = await _databaseReference!.child('LEARN_MORE').child('NUMBER_OF_ARTICLES').get();
    final numberOfArticles = snapshot.value as int;
    _numberOfArticles = numberOfArticles;
    notifyListeners();
  }

  Future<List<Article>> getArticles() async {
    int numberOfArticles = _numberOfArticles;
    this.articles = [];
    for(int i = 0 ; i <= numberOfArticles; i++){
      final snapshot = await _databaseReference!
          .child('LEARN_MORE')
          .child('ARTICLE_' + i.toString())
          .get();

      final article = snapshot.value as Map<dynamic, dynamic>?;

      if (article != null) {
        String title = (article['TITLE'] as String?)!;
        String subtitle = (article['SUBTITLE'] as String?)!;
        String description = (article['DESCRIPTION'] as String?)!;
        Article articleFounded = Article(title: title, subtitle: subtitle, description: description);
        this.articles.add(articleFounded);
      }
    }
    notifyListeners();
    return this.articles;
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
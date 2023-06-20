import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:remax_geeks/models/sellNowFormModel.dart';


class DBProvider extends ChangeNotifier{

  //INITIALIZE FIREBASE REALTIME
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  //REFERENCE TO THE DATABASE
  DatabaseReference? _databaseReference;
  //GETTING THE NUMBER OF COSTUMERS
  late int _numberOfCostumers;

  //CONSTRUCTOR
  DBProvider(){
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
  }

  //NUMBER OF COSTUMERS, INCREMENT THE NUMBER OF COSTUMERS IN THE DATABASE
  Future<void> incrementNumberOfCostumers() async{
    _numberOfCostumers++;
    await _databaseReference!.child('COSTUMERS').set(_numberOfCostumers);
    notifyListeners();
  }





}
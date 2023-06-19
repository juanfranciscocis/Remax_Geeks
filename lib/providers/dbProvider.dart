import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:remax_geeks/models/sellNowFormModel.dart';


class DBProvider extends ChangeNotifier{

  //INITIALIZE FIREBASE REALTIME
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  //REFERENCE TO THE DATABASE
  DatabaseReference? _databaseReference;

  //CONSTRUCTOR
  DBProvider(){
    _databaseReference = _database.ref();
  }

  //GETTERS
  DatabaseReference? get databaseReference => _databaseReference;

  //SETTERS
  //SET THE SELLING FORM DATA, AS A JSON OBJECT, TO THE DATABASE
  Future<void> setSellingFormData( Map<String, dynamic> sellingFormData) async{
    await _databaseReference!.child('SELLING_FORM').set(sellingFormData);
    notifyListeners();
  }
  //NUMBER OF COSTUMERS, GET THE NUMBER OF COSTUMERS FROM THE DATABASE AS INT
  Future<void> getNumberOfCostumers() async{
    final snapshot = await _databaseReference!.child('COSTUMERS').get();
    final numberOfCostumers = snapshot.value as int;
    print(numberOfCostumers);
  }





}
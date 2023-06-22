

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:remax_geeks/models/googlePlacesModel.dart';


class GooglePlacesService extends ChangeNotifier{

  //INIT GOOGLE PLACES SERVICE
  final googlePlacesService = FlutterGooglePlacesSdk('AIzaSyAPjyoOE2IYnKaf9xlXsnRcDsGRMTcGibU');
  List<String> _listOfPredictions = ['','',''];


  List<String> get listOfPredictions => _listOfPredictions;

  set listOfPredictions(List<String> value) {
    _listOfPredictions = value;
  }

  //CONSTRUCTOR
  GooglePlacesService();

  //GET PREDICTION AS A JSON
  Future<dynamic> _getPrediction(String input) async{
    final predictions = await googlePlacesService.findAutocompletePredictions(input);
    return predictions.predictions;
  }

  //GET PREDICTION AS A LIST OF STRINGS, MAX 3, USING THE GOOGLEPLACES MODEL
  getMax3PredictionsGoogle(String input) async{
    final List<AutocompletePrediction> predictions = await _getPrediction(input);
    //get only the first 3 predictions
    final List<AutocompletePrediction> max3Predictions = predictions.sublist(0,3);
    //convert to a list of strings
    listOfPredictions = [];
    for (var prediction in max3Predictions){
      listOfPredictions.add(prediction.fullText);
    }
    notifyListeners();
  }


}
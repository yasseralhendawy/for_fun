import 'package:flutter/material.dart';

class AddressDetailsController extends ChangeNotifier{
  String selectedCity;
  String selectedArea;

  List<String> cities=[
    "Alexandria",
    "Cairo",
    "Giza",
  ];

  List<String> areas=[
    "Maadi",
    "New Cairo",
    "Naser city",
    "6 October",
  ];

  void changeCityDropDown(String value){
    selectedCity=value;
    notifyListeners();
  }


  void changeAreaDropDown(String value){
    selectedArea=value;
    notifyListeners();
  }
}
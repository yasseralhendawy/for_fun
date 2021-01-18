import 'package:flutter/material.dart';
import 'package:for_fun/models/bills.dart';

class ProfileController extends ChangeNotifier{

  List<Bills> bills= [];

  ProfileController(){
    for (int i=0;i<7;i++){
      bills.add(Bills());
    }
  }

  void setExpandedOrShrink(int index){
    if (bills[index].expanded){
      bills[index].expanded= false;
    }else{
      bills[index].expanded=true;
    }
    notifyListeners();
  }

}
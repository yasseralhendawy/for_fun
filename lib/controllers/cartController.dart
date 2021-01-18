import 'package:flutter/material.dart';
import 'package:for_fun/models/product.dart';

class CartController extends ChangeNotifier{
  PageController _pageController;
  PaymentMethod method;

  PageController get pageController => _pageController;
  List<Product> items=[];
  CartController(){
    method=PaymentMethod.Method1;
    this._pageController = new PageController(initialPage: 0);
    for (int i =0;i<3;i++){
      items.add(Product(
          "name",
          "https://www.cowmakesmoo.com/image/cache/data/products/Boys_Girls_AW18_Snow_Owl_Crew_Tawny_530x%402x-1100x1100.jpg",
          0.0,
          i));
    }
  }


  void setPaymentMethod(PaymentMethod value){
    method=value;
    notifyListeners();
  }


  void proceed(){
    _pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.ease);
    notifyListeners();
  }

}

enum PaymentMethod { Method1, Method2 }
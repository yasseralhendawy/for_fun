import 'package:flutter/material.dart';

class ItemProvider extends ChangeNotifier {
  SizePrices _size;
  int _number;
  List<SizePrices> options=[
    SizePrices(size: ItemSize.Regular,price: 100),
    SizePrices(size: ItemSize.Medium,price: 125),
    SizePrices(size: ItemSize.Large,price: 150),
    SizePrices(size: ItemSize.Extra,price: 200),

  ];
  SizePrices get size => _size;

  int get number => _number;

  ItemProvider() {
    this._number = 1;
    this._size = options[0];
  }

  void setSize(SizePrices size) {
    _size = size;
    notifyListeners();
  }

  double finalPrice(){
    return _number*size.price;
  }

  void incrementCount() {
    _number++;
    notifyListeners();
  }

  void decrementCount() {
    if (_number > 1) {
      _number--;
      notifyListeners();
    }
  }
}

class SizePrices{
  ItemSize size;
  double price;

  SizePrices({this.size, this.price});

}

enum ItemSize { Regular, Medium, Large, Extra }

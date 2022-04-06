import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/formgridview.dart';

class Product extends ChangeNotifier{
  late List<Fruit> _listProduct;

  List<Fruit> get listProduct => _listProduct;
  void delete (int index){
    _listProduct.remove(index);
    notifyListeners(); // cap nhat lai
  }
  void update (Fruit n , Fruit o){

    notifyListeners(); // cap nhat lai
  }
}
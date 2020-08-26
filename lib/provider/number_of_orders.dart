import 'dart:collection';
import 'package:flutter/material.dart';

class NumbersOfOrdersProvider extends ChangeNotifier {
  final List<int> _items = [];
  // UnmodifiableListView<int> get items => UnmodifiableListView(_items);
  int _ordersNumber = 0;
  double _totalPrice = 0;

  void increaseOrderNumber() {
    _ordersNumber++;
    notifyListeners();
  }

  int get ordersNumber => _ordersNumber;

  void calculateTotalPrice(int amount, double price) {
    _totalPrice += amount * price;
    notifyListeners();
  }

  double get totalPrice => double.parse(_totalPrice.toStringAsFixed(4));
}

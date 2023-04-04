import 'package:flutter/material.dart';

import './cart.dart';

class Order {
  final String id;
  final List<Cart> product;
  final double amount;
  final DateTime date;

  Order({
    required this.amount,
    required this.date,
    required this.id,
    required this.product,
  });
}

class OrderItem with ChangeNotifier {
  final List<Order> _items = [];

  List<Order> get item {
    return [..._items];
  }

  //add Cart item to orderitem
  void addOrder(List<Cart> cartProduct, double total) {
    _items.insert(
        0,
        Order(
          amount: total,
          date: DateTime.now(),
          id: DateTime.now().toString(),
          product: cartProduct,
        ));
        notifyListeners();
  }
}

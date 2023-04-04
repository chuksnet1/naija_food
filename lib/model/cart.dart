import 'package:flutter/material.dart';

class Cart {
  final String id;
  final String prodName;
  final double price;
  final double quantity;

  Cart({
    required this.id,
    required this.price,
    required this.prodName,
    required this.quantity,
  });
}

class CartItem with ChangeNotifier {
  Map<String, Cart> _items = {};

  Map<String, Cart> get items {
    return {..._items};
  }

  int get cartItemCount {
    return _items.length;
  }

  void addCartItem(String prodId, double price, String title) {
    if (_items.containsKey(prodId)) {
      _items.update(
          prodId,
          (existingCartItem) => Cart(
                id: existingCartItem.id,
                price: existingCartItem.price,
                prodName: existingCartItem.prodName,
                quantity: existingCartItem.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
          prodId,
          () => Cart(
                id: DateTime.now().toString(),
                price: price,
                prodName: title,
                quantity: 1,
              ));
    }
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartValue) {
      total += cartValue.price * cartValue.quantity;
    });
    return total;
  }

  //Used to UNDO
  void singleRemoveItem(String prodId) {
    if (!_items.containsKey(prodId)) {
      return;
    }
    if (_items[prodId]!.quantity > 1) {
      _items.update(
        prodId,
        (existingCartItems) => Cart(
          id: existingCartItems.id,
          price: existingCartItems.price,
          prodName: existingCartItems.prodName,
          quantity: existingCartItems.quantity - 1,
        ),
      );
    }else{
      _items.remove(prodId);
    }
    notifyListeners();
  }


  // Remove
  void deleteCart (String prodId){
    _items.remove(prodId);
    notifyListeners();
  }


  //Clear cartItem
  void clearCart (){
    _items = {};
    notifyListeners();
  }
}

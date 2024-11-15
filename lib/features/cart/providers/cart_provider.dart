// lib/features/cart/providers/cart_provider.dart
import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.length;

  double get totalAmount {
    return _items.fold(0.0, (sum, item) {
      // Bersihkan string harga dari 'Rp', titik, dan spasi
      String cleanPrice = item.price
          .replaceAll('Rp', '')
          .replaceAll('.', '')
          .replaceAll(' ', '');

      // Parse ke double
      double price = double.tryParse(cleanPrice) ?? 0.0;

      // Kalikan dengan quantity
      return sum + (price * item.quantity);
    });
  }

  void addItem(CartItem item) {
    final existingIndex = _items.indexWhere(
      (existingItem) =>
          existingItem.name == item.name &&
          existingItem.category == item.category,
    );

    if (existingIndex >= 0) {
      _items[existingIndex] = _items[existingIndex].copyWith(
        quantity: _items[existingIndex].quantity + 1,
      );
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void updateQuantity(CartItem item, int newQuantity) {
    final index = _items.indexOf(item);
    if (index != -1) {
      _items[index] = item.copyWith(quantity: newQuantity);
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}

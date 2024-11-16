// lib/features/cart/providers/cart_provider.dart
import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import 'package:intl/intl.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];
  final List<Map<String, dynamic>> _transactionHistory = [];

  List<CartItem> get items => _items;
  List<Map<String, dynamic>> get transactionHistory => _transactionHistory;

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

  void addToHistory(
    String status, {
    required String selectedBank,
    required Map<String, String> recipientDetails,
  }) {
    final String id =
        DateTime.now().millisecondsSinceEpoch.toString().substring(5);
    final String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
    final double amount = totalAmount + 300000; // Including shipping cost

    _transactionHistory.add({
      'id': id,
      'date': date,
      'total': 'Rp. ${_formatNumber(amount)}',
      'status': status,
      'selectedBank': selectedBank,
      'recipientName': recipientDetails['name'],
      'address': recipientDetails['address'],
      'items': _items
          .map((item) => {
                'name': item.name,
                'quantity': item.quantity,
                'price': item.price,
              })
          .toList(),
    });

    clearCart();
    notifyListeners();
  }

  String _formatNumber(double number) {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String result = number.toStringAsFixed(0);
    return result.replaceAllMapped(reg, (Match match) => '${match[1]}.');
  }
}

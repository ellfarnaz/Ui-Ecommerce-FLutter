// lib/features/cart/models/cart_item.dart
class CartItem {
  final String name;
  final String price;
  final String imageUrl;
  final String category;
  final int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.quantity = 1,
  });

  double get numericPrice {
    String cleanPrice = price.replaceAll(RegExp(r'[^0-9]'), '');
    return double.parse(cleanPrice);
  }

  String _formatNumber(double number) {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String result = number.toStringAsFixed(0);
    return result.replaceAllMapped(reg, (Match match) => '${match[1]}.');
  }

  String get totalPrice {
    double total = numericPrice * quantity;
    return 'Rp ${_formatNumber(total)}';
  }

  String get formattedPrice {
    return 'Rp ${_formatNumber(numericPrice)}';
  }

  CartItem copyWith({
    String? name,
    String? price,
    String? imageUrl,
    String? category,
    int? quantity,
  }) {
    return CartItem(
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
    );
  }
}

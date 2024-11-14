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

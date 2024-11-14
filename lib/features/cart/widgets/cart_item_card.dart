// lib/features/cart/widgets/cart_item_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../models/cart_item.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;
  final Function(int) onUpdateQuantity;
  final VoidCallback onRemove;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onUpdateQuantity,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Produk
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: Colors.grey[900]!, // Warna border abu-abu muda
                width: 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(0, 2), // Menggeser shadow ke bawah
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.w),

          // Informasi Produk
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Baris nama dan tombol close
                Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Penting untuk alignment
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Kolom nama dan kategori
                    Expanded(
                      child: Text(
                        item.name,
                        style: AppTextStyles.body(context).copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    // Tombol close
                    GestureDetector(
                      onTap: onRemove,
                      child: Icon(
                        Icons.close,
                        size: 18.w,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                // Kategori
                SizedBox(height: 4.h),
                Text(
                  item.category.toUpperCase(),
                  style: AppTextStyles.subtitle(context).copyWith(
                    color: Colors.grey[400],
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                // Baris harga dan kontrol kuantitas
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.price,
                      style: AppTextStyles.body(context).copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    // Quantity Controls
                    Container(
                      decoration: BoxDecoration(
                        color:
                            const Color(0xFFF8F5F2), // Background color #F8F5F2
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Row(
                        children: [
                          // Tombol Minus
                          Container(
                            width: 32.w,
                            height: 32.w,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.remove,
                                size: 16.w,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          // Angka Quantity
                          Container(
                            width: 32.w,
                            height: 32.w,
                            color: Colors
                                .transparent, // Ubah ke transparent agar background parent terlihat
                            alignment: Alignment.center,
                            child: Text(
                              item.quantity.toString(),
                              style: AppTextStyles.body(context).copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          // Tombol Plus
                          Container(
                            width: 32.w,
                            height: 32.w,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 16.w,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

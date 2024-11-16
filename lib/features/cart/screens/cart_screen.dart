import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_item_card.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/page_transition.dart';
import 'payment/delivery_method_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Keranjang',
          style: AppTextStyles.heading(context).copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 120.w,
                    color: AppColors.textSubtitle,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Keranjang Kosong',
                    style: AppTextStyles.heading(context),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              // Cart Items
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(
                    top: 20.h,
                    bottom: 20.h,
                    left: 20.w,
                    right: 20.w,
                  ),
                  itemCount: cartProvider.items.length,
                  separatorBuilder: (context, index) => SizedBox(height: 24.h),
                  itemBuilder: (context, index) {
                    final item = cartProvider.items[index];
                    return CartItemCard(
                      item: item,
                      onUpdateQuantity: (quantity) {
                        cartProvider.updateQuantity(item, quantity);
                      },
                      onRemove: () {
                        cartProvider.removeItem(item);
                      },
                    );
                  },
                ),
              ),

              // Bottom Button
              Padding(
                padding: EdgeInsets.all(20.w),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      SlidePageRoute(
                        page: const DeliveryMethodScreen(),
                        direction: AxisDirection.left,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: Size(double.infinity, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                  ),
                  child: Text(
                    'Pesan',
                    style: AppTextStyles.buttonText(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

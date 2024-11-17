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
      body: DefaultTabController(
        length: 1,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  backgroundColor: innerBoxIsScrolled
                      ? const Color(0xFFFFD700)
                      : Colors.white,
                  elevation: innerBoxIsScrolled ? 0.5 : 0,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  title: Text(
                    'Keranjang',
                    style: AppTextStyles.heading(context).copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  centerTitle: true,
                ),
              ),
            ];
          },
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

              return Stack(
                children: [
                  // Cart Items List dengan padding tambahan untuk SliverAppBar
                  Builder(
                    builder: (context) {
                      return CustomScrollView(
                        slivers: [
                          SliverOverlapInjector(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context),
                          ),
                          SliverPadding(
                            padding:
                                EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 90.h),
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  final item = cartProvider.items[index];
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 24.h),
                                    child: CartItemCard(
                                      item: item,
                                      onUpdateQuantity: (quantity) {
                                        cartProvider.updateQuantity(
                                            item, quantity);
                                      },
                                      onRemove: () {
                                        cartProvider.removeItem(item);
                                      },
                                    ),
                                  );
                                },
                                childCount: cartProvider.items.length,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  // Floating Bottom Button (tetap sama)
                  Positioned(
                    left: 20.w,
                    right: 20.w,
                    bottom: 20.h,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: const Offset(0, -2),
                          ),
                        ],
                      ),
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
                          minimumSize: Size(double.infinity, 45.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        child: Text(
                          'Pesan Sekarang',
                          style: AppTextStyles.buttonText(context).copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

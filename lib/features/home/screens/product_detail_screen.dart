import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
// import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_colors.dart';
import '../../../features/cart/providers/cart_provider.dart';
import '../../../features/cart/models/cart_item.dart';

class ProductDetailScreen extends StatefulWidget {
  final String name;
  final String price;
  final String imageUrl;
  final String category;
  final String heroTag;

  const ProductDetailScreen({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.heroTag,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _isExpanded = false;
  final String _description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut';

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  void _showSuccessDialog() {
    final cartItem = CartItem(
      name: widget.name,
      price: widget.price,
      imageUrl: widget.imageUrl,
      category: widget.category,
    );

    context.read<CartProvider>().addItem(cartItem);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 250.w,
                  height: 300.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.shopping_cart_checkout,
                    size: 50.w,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Barang berhasil ditambahkan ke keranjang.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body(context).copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Cek menu keranjang untuk melihat pesanan anda',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.subtitle(context),
                ),
              ],
            ),
          ),
        );
      },
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pop(context); // Tutup dialog
        Navigator.pop(context); // Kembali ke home screen
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.width,
                pinned: false,
                floating: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.light,
                ),
                leading: Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 20.h),
                  child: Material(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12.r),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.r),
                      splashFactory: InkRipple.splashFactory,
                      splashColor: Colors.black.withOpacity(0.1),
                      highlightColor: Colors.black.withOpacity(0.05),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        width: 40.w,
                        height: 40.w,
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.textDark,
                          size: 24.w,
                        ),
                      ),
                    ),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: widget.heroTag,
                    child: CachedNetworkImage(
                      imageUrl: widget.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFCD65B),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            widget.category[0].toUpperCase() +
                                widget.category.substring(1).toLowerCase(),
                            style: AppTextStyles.subtitle(context).copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          widget.name,
                          style: AppTextStyles.productTitle(context),
                        ),
                        SizedBox(height: 16.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _description,
                              maxLines: _isExpanded ? null : 8,
                              overflow:
                                  _isExpanded ? null : TextOverflow.ellipsis,
                              style: AppTextStyles.body(context),
                            ),
                            if (!_isExpanded) ...[
                              SizedBox(height: 8.h),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isExpanded = true;
                                  });
                                },
                                child: Text(
                                  'Baca selengkapnya',
                                  style: AppTextStyles.buttonText(context),
                                ),
                              ),
                            ],
                          ],
                        ),
                        SizedBox(height: 100.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 25.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.bottomBarBackground,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'HARGA',
                        style: AppTextStyles.subtitle(context).copyWith(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        widget.price,
                        style: AppTextStyles.productPrice(context).copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 45.h,
                    width: 192.w,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(
                          25.r), // Border radius untuk tombol
                    ),
                    child: TextButton(
                      onPressed: _showSuccessDialog,
                      child: Text(
                        '+ Keranjang',
                        style: AppTextStyles.buttonText(context).copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    super.dispose();
  }
}

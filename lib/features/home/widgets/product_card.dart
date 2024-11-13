import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../screens/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final String category;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final String uniqueTag =
        'product-$name-${DateTime.now().millisecondsSinceEpoch}';

    return GestureDetector(
      onTap: () => _navigateToDetail(context, uniqueTag),
      child: Hero(
        tag: uniqueTag,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusL),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductImage(),
              _buildProductInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppSizes.radiusL),
        ),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          placeholder: _buildPlaceholder,
          errorWidget: _buildErrorWidget,
        ),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.paddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSizes.paddingXS),
          Text(
            price,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context, String url) {
    return Container(
      color: Colors.grey[200],
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context, String url, dynamic error) {
    return Container(
      color: Colors.grey[200],
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.grey, size: 32),
          SizedBox(height: AppSizes.paddingS),
          Text(
            'Gambar tidak tersedia',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  void _navigateToDetail(BuildContext context, String uniqueTag) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ProductDetailScreen(
          name: name,
          price: price,
          imageUrl: imageUrl,
          category: category,
          heroTag: uniqueTag,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}

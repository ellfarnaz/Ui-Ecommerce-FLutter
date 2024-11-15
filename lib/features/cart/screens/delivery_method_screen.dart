import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_text_styles.dart';
import 'recipient_detail_screen.dart';
import '../../../core/utils/page_transition.dart';

class DeliveryMethodScreen extends StatelessWidget {
  const DeliveryMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Metode Pengambilan Barang',
              style: AppTextStyles.heading(context).copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 3.h),

            // Progress indicator
            Text(
              'Langkah 1 dari 3',
              style: AppTextStyles.body(context),
            ),

            SizedBox(height: 8.h),

            LinearProgressIndicator(
              value: 0.33,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
            ),

            SizedBox(height: 24.h),

            Text(
              'Pilih metode pengambilan barang',
              style: AppTextStyles.body(context),
            ),

            SizedBox(height: 16.h),

            // Delivery options
            _DeliveryOption(
              title: 'Diantar dengan kurir',
              description:
                  'Barang yang anda pesan akan diantar dengan kurir yang telah kami sediakan, dengan biaya pengiriman sesuai alamat penerima',
              onTap: () {
                // Handle courier delivery
              },
            ),

            SizedBox(height: 16.h),

            _DeliveryOption(
              title: 'Ambil sendiri',
              description:
                  'Anda langsung menuju ke toko kami untuk mengambil barang yang anda beli tanpa perlu biaya pengiriman',
              onTap: () {
                Navigator.push(
                  context,
                  SlidePageRoute(
                    page: const RecipientDetailScreen(),
                    direction: AxisDirection.left,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DeliveryOption extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const _DeliveryOption({
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.body(context).copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    description,
                    style: AppTextStyles.subtitle(context),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.grey[600],
            ),
          ],
        ),
      ),
    );
  }
}

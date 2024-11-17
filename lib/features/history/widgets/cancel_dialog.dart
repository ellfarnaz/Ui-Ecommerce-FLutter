import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../cart/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CancelDialog extends StatelessWidget {
  final String id;

  const CancelDialog({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Batalkan Barang',
              style: AppTextStyles.heading(context).copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            Image.asset(
              'assets/images/cancel.png',
              height: 180.h,
              width: 180.w,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 24.h),
            Text(
              'Pastikan anda telah menerima dan mengecek barang yang sudah anda dapatkan, sebelum melakukan konfirmasi',
              style: AppTextStyles.body(context).copyWith(
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              height: 45.h,
              child: ElevatedButton(
                onPressed: () {
                  final cartProvider =
                      Provider.of<CartProvider>(context, listen: false);
                  cartProvider.updateTransactionStatus(id, 'Dibatalkan');
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE31E24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: Text(
                  'Batalkan Pesanan',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

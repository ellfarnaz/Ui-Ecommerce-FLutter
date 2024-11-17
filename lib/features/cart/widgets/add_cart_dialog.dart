import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_text_styles.dart';

class AddCartDialog extends StatelessWidget {
  const AddCartDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      backgroundColor: Colors.white,
      child: Container(
        width: 333.w,
        height: 347.h,
        padding:
            EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h, bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/addcart.png',
              height: 215.h,
              width: 241.w,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20.h),
            Text(
              'Barang berhasil ditambahkan ke keranjang.',
              textAlign: TextAlign.center,
              style: AppTextStyles.body(context).copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Cek menu keranjang untuk melihat pesanan anda',
              textAlign: TextAlign.center,
              style: AppTextStyles.subtitle(context).copyWith(
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

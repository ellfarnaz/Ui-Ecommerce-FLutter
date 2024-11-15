import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import 'payment_detail_screen.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final String selectedBank;
  final double totalAmount;

  const PaymentSuccessScreen({
    super.key,
    required this.selectedBank,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/confirmed.png',
                height: 300.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 32.h),
              Text(
                'Terima kasih telah berbelanja',
                style: AppTextStyles.heading(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                'Selamat pembelian anda berhasil segera lakukan pembayaran agar pesanan anda segera diproses',
                style: AppTextStyles.body(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentDetailScreen(
                        selectedBank: selectedBank,
                        totalAmount: totalAmount,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  fixedSize: Size(293.w, 45.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: Text(
                  'Bayar',
                  style: AppTextStyles.buttonText(context),
                ),
              ),
              SizedBox(height: 16.h),
              OutlinedButton(
                onPressed: () {
                  // Kembali ke halaman home
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(293.w, 45.h),
                  side: const BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: Text(
                  'Lanjut Belanja',
                  style: AppTextStyles.buttonText(context).copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

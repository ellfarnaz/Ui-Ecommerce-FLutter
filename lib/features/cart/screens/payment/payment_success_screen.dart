import 'package:belajar_fluttetr/features/main/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/page_transition.dart';
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
                    SlidePageRoute(
                      page: PaymentDetailScreen(
                        selectedBank: selectedBank,
                        totalAmount: totalAmount,
                      ),
                      direction: AxisDirection.left,
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
                  // Kembali ke MainScreen dengan index 0 (HomeScreen)
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(),
                    ),
                    (route) => false,
                  );
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

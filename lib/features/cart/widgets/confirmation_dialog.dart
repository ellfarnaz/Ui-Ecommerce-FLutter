import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../screens/payment/payment_success_screen.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class ConfirmationDialog extends StatefulWidget {
  final String selectedBank;
  final double totalAmount;

  const ConfirmationDialog({
    super.key,
    required this.selectedBank,
    required this.totalAmount,
  });

  @override
  State<ConfirmationDialog> createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  bool _isLoading = false;

  void _handleConfirmation() async {
    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addToHistory(
      'Menunggu',
      selectedBank: widget.selectedBank,
      recipientDetails: {
        'name': 'Clowd',
        'address':
            'Jalan, Griya Anyar, Gg. Bandeng, No. 37, Denpasar Selatan, Denpasar, Bali, 80221',
      },
    );

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentSuccessScreen(
          selectedBank: widget.selectedBank,
          totalAmount: widget.totalAmount,
        ),
      ),
      (route) => false,
    );
  }

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
              'Konfirmasi Pembayaran',
              style: AppTextStyles.heading(context).copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            Image.asset(
              'assets/images/manthingking.png',
              height: 180.h,
              width: 180.w,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 24.h),
            Text(
              'Apakah anda yakin untuk mengkonfirmasi pembelian ini',
              style: AppTextStyles.body(context).copyWith(
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                // Tombol Tidak tetap ada
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      minimumSize: Size(double.infinity, 45.h),
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'Tidak',
                      style: AppTextStyles.buttonText(context).copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                // Area tombol Ya/Loading
                Expanded(
                  child: _isLoading
                      ? SizedBox(
                          height: 45.h,
                          child: Center(
                            child: SizedBox(
                              width: 30.w,
                              height: 30.w,
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                                strokeWidth: 4.w,
                              ),
                            ),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: _handleConfirmation,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            side: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            minimumSize: Size(double.infinity, 45.h),
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'Ya',
                            style: AppTextStyles.buttonText(context),
                          ),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

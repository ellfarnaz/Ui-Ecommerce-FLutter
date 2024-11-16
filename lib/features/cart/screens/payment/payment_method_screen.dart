import 'package:belajar_fluttetr/core/utils/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import 'payment_confirmation_screen.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                    backgroundColor:
                        innerBoxIsScrolled ? AppColors.primary : Colors.white,
                    elevation: innerBoxIsScrolled ? 0.5 : 0,
                    pinned: true,
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                    title: AnimatedOpacity(
                      opacity: innerBoxIsScrolled ? 1.0 : 0,
                      duration: const Duration(milliseconds: 130),
                      child: Text(
                        'Metode Pembayaran',
                        style: AppTextStyles.heading(context).copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    forceElevated: innerBoxIsScrolled,
                  ),
                ),
              ];
            },
            body: Builder(
              builder: (context) {
                return CustomScrollView(
                  slivers: [
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Metode Pembayaran',
                              style: AppTextStyles.heading(context).copyWith(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              'Langkah 2 dari 3',
                              style: AppTextStyles.body(context),
                            ),
                            SizedBox(height: 8.h),
                            LinearProgressIndicator(
                              value: 0.66,
                              backgroundColor: Colors.grey[200],
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.amber),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              'Pilih metode pembayaran',
                              style: AppTextStyles.body(context),
                            ),
                            SizedBox(height: 16.h),
                            _buildPaymentOption(context, 'mandiri'),
                            _buildPaymentOption(context, 'bac'),
                            _buildPaymentOption(context, 'bni'),
                            _buildPaymentOption(context, 'briva'),
                            _buildPaymentOption(context, 'cimbniaga'),
                            _buildPaymentOption(context, 'permata'),
                            SizedBox(height: 30.h), // Tambahkan ini
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(BuildContext context, String bankName) {
    final Map<String, String> bankTitles = {
      'mandiri': 'Mandiri Virtual Account',
      'bac': 'BCA Virtual Account',
      'bni': 'BNI Virtual Account',
      'briva': 'BRIVA Virtual Account',
      'cimbniaga': 'CIMB NIAGA Virtual Account',
      'permata': 'Permata Virtual Account',
    };

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              SlidePageRoute(
                page: PaymentConfirmationScreen(
                  selectedBank: bankName,
                  recipientDetails: const {
                    'name': 'Nama yang diisi',
                    'address': 'Alamat yang diisi',
                  },
                ),
                direction: AxisDirection.left,
              ),
            );
          },
          borderRadius: BorderRadius.circular(8.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/$bankName.png',
                  width: 40.w,
                  height: 40.w,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.image_not_supported,
                      size: 40.w,
                      color: Colors.grey,
                    );
                  },
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    bankTitles[bankName] ?? '',
                    style: AppTextStyles.body(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  size: 24.w,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

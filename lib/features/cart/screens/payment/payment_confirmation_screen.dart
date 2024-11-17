import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/features/cart/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_text_styles.dart';
import '../../widgets/confirmation_dialog.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  final String selectedBank;
  final Map<String, String> recipientDetails;

  const PaymentConfirmationScreen({
    super.key,
    required this.selectedBank,
    required this.recipientDetails,
  });

  void _showConfirmationDialog(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (BuildContext context) => ConfirmationDialog(
        selectedBank: selectedBank,
        totalAmount: double.parse(_formatPrice(cartProvider.totalAmount)
            .replaceAll(RegExp(r'[^0-9]'), '')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

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
                  backgroundColor:
                      innerBoxIsScrolled ? AppColors.primary : Colors.white,
                  elevation: innerBoxIsScrolled ? 0.5 : 0,
                  pinned: true,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  title: AnimatedOpacity(
                    opacity: innerBoxIsScrolled ? 1.0 : 0,
                    duration: const Duration(milliseconds: 130),
                    child: Text(
                      'Konfirmasi Pembayaran',
                      style: AppTextStyles.heading(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
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
                            'Konfirmasi Pembayaran',
                            style: AppTextStyles.heading(context).copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            'Langkah 3 dari 3',
                            style: AppTextStyles.body(context),
                          ),
                          SizedBox(height: 8.h),
                          LinearProgressIndicator(
                            value: 1.0,
                            backgroundColor: Colors.grey[200],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.amber),
                          ),
                          SizedBox(height: 24.h),

                          // Metode Pembayaran Section
                          _buildSection(
                            'Metode Pembayaran',
                            child: _buildPaymentMethod(selectedBank),
                          ),

                          // Detail Pembelian Section
                          _buildSection(
                            'Detail Pembelian',
                            child: Column(
                              children: [
                                _buildDetailRow('Nama Penerima',
                                    recipientDetails['name'] ?? ''),
                                SizedBox(height: 8.h),
                                _buildDetailRow('Alamat',
                                    recipientDetails['address'] ?? ''),
                              ],
                            ),
                          ),

                          // Ringkasan Pembelian Section
                          _buildSection(
                            'Ringkasan Pembelian',
                            child: Column(
                              children: [
                                ...cartProvider.items
                                    .map((item) => _buildItemRow(
                                          '${item.quantity}x ${item.name}',
                                          item.totalPrice,
                                        )),
                                SizedBox(height: 8.h),
                                _buildItemRow(
                                    'Biaya pengiriman', _formatPrice(300000)),
                                Divider(height: 24.h),
                                _buildItemRow(
                                  'Total',
                                  _formatPrice(
                                      cartProvider.totalAmount + 300000),
                                  isTotal: true,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 40.h),

                          // Konfirmasi Button
                          ElevatedButton(
                            onPressed: () => _showConfirmationDialog(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              minimumSize: Size(double.infinity, 50.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                            ),
                            child: Text(
                              'Konfirmasi Pembelian',
                              style: AppTextStyles.buttonText(context).copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
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
    );
  }

  Widget _buildSection(String title, {required Widget child}) {
    return Container(
      margin: EdgeInsets.only(top: 24.h),
      padding: EdgeInsets.all(16.w),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16.h),
          child,
        ],
      ),
    );
  }

  Widget _buildPaymentMethod(String bankName) {
    final Map<String, String> bankTitles = {
      'mandiri': 'Mandiri Virtual Account',
      'bca': 'BCA Virtual Account',
      'bni': 'BNI Virtual Account',
      'briva': 'BRIVA Virtual Account',
      'cimbniaga': 'CIMB NIAGA Virtual Account',
      'permata': 'Permata Virtual Account',
    };

    return Row(
      children: [
        Image.asset(
          'assets/images/$bankName.png',
          width: 40.w,
          height: 40.w,
        ),
        SizedBox(width: 12.w),
        Text(
          bankTitles[bankName] ?? '',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black87,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Widget _buildItemRow(String label, String value, {bool isTotal = false}) {
    // Format harga jika mengandung 'Rp'
    final formattedValue = value.contains('Rp') ? _formatPrice(value) : value;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
              color: Colors.black87,
            ),
          ),
          Text(
            formattedValue,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  String _formatPrice(dynamic amount) {
    if (amount is String) {
      // Jika input string, bersihkan dari karakter non-angka
      String cleanAmount = amount.replaceAll(RegExp(r'[^0-9]'), '');
      double numericAmount = double.parse(cleanAmount);
      return _formatNumber(numericAmount);
    } else if (amount is num) {
      return _formatNumber(amount.toDouble());
    }
    return '0';
  }

  String _formatNumber(double number) {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String result = number.toStringAsFixed(0);
    return 'Rp. ${result.replaceAllMapped(reg, (Match match) => '${match[1]}.')}';
  }
}

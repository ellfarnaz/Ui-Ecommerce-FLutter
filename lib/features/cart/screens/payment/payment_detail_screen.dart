import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../../core/constants/app_text_styles.dart';

class PaymentDetailScreen extends StatefulWidget {
  final String selectedBank;
  final double totalAmount;

  const PaymentDetailScreen({
    super.key,
    required this.selectedBank,
    required this.totalAmount,
  });

  @override
  State<PaymentDetailScreen> createState() => _PaymentDetailScreenState();
}

class _PaymentDetailScreenState extends State<PaymentDetailScreen> {
  String formatDeadline() {
    final deadline = DateTime.now().add(const Duration(hours: 24));
    return DateFormat('EEEE, d MMMM y, HH:mm', 'id_ID').format(deadline);
  }

  void _handleCopy(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Teks berhasil disalin',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFFFCD65B),
        duration: const Duration(seconds: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r),
            topRight: Radius.circular(8.r),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID');
  }

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
        title: Text(
          'Pembayaran',
          style: AppTextStyles.heading(context).copyWith(
            fontSize: 18.sp,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Segera selesaikan pembayaran anda\nsebelum stok habis',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: Colors
                            .grey[300]!, // Menambahkan border color grey gelap
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'SEGERA LAKUKAN PEMBAYARAN DALAM WAKTU',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '23 Jam : 56 Menit : 10 Detik',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          formatDeadline(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'Poppins',
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[300]!,
                    width: 1,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                  top: 24.w,
                  bottom: 8.w, // Mengurangi padding bottom
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Transefer ke nomor Virtual Account',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/${widget.selectedBank}.png',
                          height: 30.h,
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          '0192380491823948',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF3E4462),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => _handleCopy('0192380491823948'),
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: EdgeInsets.only(top: 15.w, bottom: 15.w),
                        child: Text(
                          'Salin ke keyboard',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFCD65B),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[300]!,
                    width: 1,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                  top: 24.w,
                  bottom: 8.w, // Mengurangi padding bottom
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jumlah yang harus dibayar',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: 'Rp ',
                        decimalDigits: 0,
                      ).format(widget.totalAmount),
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF3E4462),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _handleCopy(NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: 'Rp ',
                        decimalDigits: 0,
                      ).format(widget.totalAmount)),
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.w, bottom: 15.w),
                        child: Text(
                          'Salin ke keyboard',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFCD65B),
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
      ),
    );
  }
}

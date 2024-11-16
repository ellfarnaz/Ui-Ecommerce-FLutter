import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
// import '../../../core/constants/app_text_styles.dart';
import '../../cart/providers/cart_provider.dart';
import '../../cart/screens/payment/payment_detail_screen.dart';
import '../../../core/utils/page_transition.dart';

class TransactionDetailScreen extends StatelessWidget {
  final String id;
  final String date;
  final String total;
  final String status;

  const TransactionDetailScreen({
    super.key,
    required this.id,
    required this.date,
    required this.total,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final transaction = cartProvider.transactionHistory.firstWhere(
      (t) => t['id'] == id,
      orElse: () => {},
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 31, 34),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Detail Transaksi',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFFE84C4F),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - kToolbarHeight,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '# ID Pembelian : ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: id,
                                    style: TextStyle(
                                      color: const Color(0xFFE84C4F),
                                      fontSize: 16.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 5.h,
                              ),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFF5F5F5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: Text(
                                status.toLowerCase() == 'diproses'
                                    ? 'Terkonfirmasi'
                                    : status.toLowerCase() == 'selesai'
                                        ? 'Selesai'
                                        : 'Belum dibayar',
                                style: TextStyle(
                                  color: const Color(0xFFE84C4F),
                                  fontSize: 14.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      _buildSection(
                        'Metode Pembayaran',
                        child: _buildPaymentMethod(),
                      ),
                      SizedBox(height: 20.h),
                      _buildSection(
                        'Detail Pembelian',
                        child: _buildPurchaseDetails(transaction),
                      ),
                      SizedBox(height: 20.h),
                      _buildSection(
                        'Ringkasan Pembelian',
                        child: _buildPurchaseSummary(transaction),
                      ),
                      SizedBox(height: 30.h),
                      _buildActionButtons(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, {required Widget child}) {
    return Container(
      width: 350.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 20,
            offset: Offset(0, 5),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF3E4462),
              fontSize: 14.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10.h),
          child,
        ],
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        final transaction = cartProvider.transactionHistory.firstWhere(
          (t) => t['id'] == id,
          orElse: () => {},
        );

        final bank = transaction['selectedBank'] ?? 'mandiri';

        return Row(
          children: [
            Image.asset(
              'assets/images/$bank.png',
              height: 24.h,
            ),
            SizedBox(width: 12.w),
            Text(
              '${bank.toUpperCase()} Virtual Account',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black87,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPurchaseDetails(Map<String, dynamic> transaction) {
    return Column(
      children: [
        _buildDetailRow(
            'Nama Penerima', transaction['recipientName'] ?? 'Clowd'),
        SizedBox(height: 12.h),
        _buildDetailRow(
          'Alamat',
          transaction['address'] ??
              'Jalan, Griya Anyar, Gg. Bandeng, No. 37, Denpasar Selatan, Denpasar, Bali, 80221',
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 10.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: const Color(0xFF3E4462),
                fontSize: 10.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: const Color(0xFF7E7E7E),
                fontSize: 10.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPurchaseSummary(Map<String, dynamic> transaction) {
    final items = transaction['items'] as List<dynamic>? ?? [];

    return Column(
      children: [
        ...items.map((item) => _buildItemRow(
              '${item['quantity']}x ${item['name']}',
              item['price'],
            )),
        _buildItemRow('Biaya pengiriman', 'Rp. 300.000'),
        SizedBox(height: 12.h),
        Divider(color: Colors.grey[300]),
        SizedBox(height: 12.h),
        _buildItemRow('Total', total, isTotal: true),
      ],
    );
  }

  Widget _buildItemRow(String label, String value, {bool isTotal = false}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: isTotal ? 20.h : 5.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isTotal)
                Text(
                  '1x ',
                  style: TextStyle(
                    color: const Color(0xFF3E4462),
                    fontSize: 10.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              SizedBox(
                width: 125.w,
                child: Text(
                  label,
                  style: TextStyle(
                    color: const Color(0xFF3E4462),
                    fontSize: isTotal ? 14.sp : 10.sp,
                    fontFamily: 'Poppins',
                    fontWeight: isTotal ? FontWeight.w700 : FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              color:
                  isTotal ? const Color(0xFF181C1D) : const Color(0xFF7E7E7E),
              fontSize: isTotal ? 14.sp : 10.sp,
              fontFamily: 'Poppins',
              fontWeight: isTotal ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    if (status.toLowerCase() != 'menunggu') return const SizedBox.shrink();

    final transaction =
        Provider.of<CartProvider>(context).transactionHistory.firstWhere(
              (t) => t['id'] == id,
              orElse: () => {},
            );

    final bank = transaction['selectedBank'] ?? 'mandiri';

    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              SlidePageRoute(
                page: PaymentDetailScreen(
                  selectedBank: bank,
                  totalAmount: double.parse(
                    total.replaceAll(RegExp(r'[^0-9]'), ''),
                  ),
                ),
                direction: AxisDirection.left,
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            minimumSize: Size(double.infinity, 50.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.r),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Lanjutkan pembayaran',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8.w),
              Icon(Icons.chevron_right, color: Colors.white, size: 24.sp),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        ElevatedButton(
          onPressed: () {
            // Implementasi pembatalan pembelian
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE31E24),
            minimumSize: Size(double.infinity, 50.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.r),
            ),
          ),
          child: Text(
            'Batalkan Pembelian',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

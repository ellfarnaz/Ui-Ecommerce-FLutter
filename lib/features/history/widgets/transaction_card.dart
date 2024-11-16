import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/page_transition.dart';
import '../screens/transaction_detail_screen.dart';
// import '../../../core/constants/app_colors.dart';
// import '../../../core/constants/app_text_styles.dart';

class TransactionCard extends StatelessWidget {
  final String id;
  final String date;
  final String total;
  final String status;
  final VoidCallback onDetailPressed;
  final Color statusColor;

  const TransactionCard({
    super.key,
    required this.id,
    required this.date,
    required this.total,
    required this.status,
    required this.onDetailPressed,
    this.statusColor = Colors.red,
  });

  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'menunggu':
        return Colors.red;
      case 'diproses':
        return const Color(0xFFFFD233);
      case 'selesai':
        return Colors.green;
      case 'dibatalkan':
        return Colors.grey;
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 162.h,
      width: 349.w,
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: Colors.grey[200]!,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ID Pembelian dan Tanggal
          Container(
            padding: EdgeInsets.only(
                left: 16.w, right: 16.w, top: 23.h, bottom: 12.h),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[200]!,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ID Pembelian: $id',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          // Total dan Detail
          Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        total,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 36.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            SlidePageRoute(
                              page: TransactionDetailScreen(
                                id: id,
                                date: date,
                                total: total,
                                status: status,
                              ),
                              direction: AxisDirection.left,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: status.toLowerCase() == 'diproses'
                              ? const Color(0xFFFFD233)
                              : status.toLowerCase() == 'selesai'
                                  ? Colors.green
                                  : const Color(0xFFE31E24),
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(),
                          minimumSize: Size(100.w, 36.h),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 32.w),
                          alignment: Alignment.center,
                          child: Text(
                            'Detail',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: status.toLowerCase() == 'diproses'
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: Text(
                        status.toLowerCase() == 'diproses'
                            ? 'Terkonfirmasi'
                            : status,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: status.toLowerCase() == 'diproses'
                              ? const Color(0xFFFFD233)
                              : status.toLowerCase() == 'selesai'
                                  ? Colors.green
                                  : const Color(0xFFE31E24),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:belajar_fluttetr/features/history/screens/transaction_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../features/history/widgets/transaction_card.dart';
import '../../../features/cart/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  String selectedStatus = 'Menunggu';
  bool isSlideLeft = true;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        isSlideLeft = _tabController.index > _tabController.previousIndex;
        selectedStatus = _getStatusFromIndex(_tabController.index);
      });
    }
  }

  String _getStatusFromIndex(int index) {
    switch (index) {
      case 0:
        return 'Menunggu';
      case 1:
        return 'Diproses';
      case 2:
        return 'Selesai';
      case 3:
        return 'Dibatalkan';
      default:
        return 'Menunggu';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Riwayat Transaksi',
          style: AppTextStyles.heading(context).copyWith(
            fontSize: 18.sp,
            color: const Color(0xFF2D3250),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                controller: _tabController,
                isScrollable: false,
                labelPadding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: const BoxDecoration(),
                labelColor: Colors.transparent,
                unselectedLabelColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabs: [
                  _buildTab('Menunggu', 0),
                  _buildTab('Diproses', 1),
                  _buildTab('Selesai', 2),
                  _buildTab('Dibatalkan', 3),
                ],
              ),
              SizedBox(height: 5.h),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildTabContent('Menunggu'),
                    _buildTabContent('Diproses'),
                    _buildTabContent('Selesai'),
                    _buildTabContent('Dibatalkan'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    bool isSelected = _tabController.index == index;
    return Tab(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: isSelected
                  ? text.toLowerCase() == 'menunggu' ||
                          text.toLowerCase() == 'dibatalkan'
                      ? const Color(0xFFE31E24)
                      : _getStatusColor(text)
                  : Colors.grey[600],
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.h),
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: isSelected ? 40.w : 0,
            height: 3.h,
            decoration: BoxDecoration(
              color: text.toLowerCase() == 'menunggu' ||
                      text.toLowerCase() == 'dibatalkan'
                  ? const Color(0xFFE31E24)
                  : _getStatusColor(text),
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(String status) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        final transactions = cartProvider.transactionHistory
            .where((transaction) =>
                transaction['status'].toString().toLowerCase() ==
                status.toLowerCase())
            .toList();

        if (transactions.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.history,
                  size: 120.w,
                  color: AppColors.textSubtitle,
                ),
                SizedBox(height: 16.h),
                Text(
                  'Belum ada transaksi',
                  style: AppTextStyles.heading(context),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return TransactionCard(
              id: transaction['id'],
              date: transaction['date'],
              total: transaction['total'],
              status: status,
              statusColor: _getStatusColor(status),
              onDetailPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionDetailScreen(
                      id: transaction['id'],
                      date: transaction['date'],
                      total: transaction['total'],
                      status: status,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Color _getStatusColor(String status) {
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
}

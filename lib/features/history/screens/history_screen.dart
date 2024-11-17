import 'package:ecommerce/features/history/screens/transaction_detail_screen.dart';
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
      body: DefaultTabController(
        length: 1,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  title: Text(
                    'Riwayat Transaksi',
                    style: AppTextStyles.heading(context).copyWith(
                      fontSize: 18.sp,
                      color: const Color(0xFF2D3250),
                    ),
                  ),
                  centerTitle: true,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(50.h),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: innerBoxIsScrolled
                            ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 4),
                                  spreadRadius: 0,
                                ),
                              ]
                            : null,
                      ),
                      child: TabBar(
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
                    ),
                  ),
                  forceElevated: false,
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              _buildScrollableContent('Menunggu'),
              _buildScrollableContent('Diproses'),
              _buildScrollableContent('Selesai'),
              _buildScrollableContent('Dibatalkan'),
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

  Widget _buildScrollableContent(String status) {
    return Builder(
      builder: (context) {
        return CustomScrollView(
          slivers: [
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(20.w, 5.h, 20.w, 20.h),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Consumer<CartProvider>(
                      builder: (context, cartProvider, child) {
                        final transactions = cartProvider.transactionHistory
                            .where((transaction) =>
                                transaction['status']
                                    .toString()
                                    .toLowerCase() ==
                                status.toLowerCase())
                            .toList();

                        if (transactions.isEmpty) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.15),
                              Icon(
                                _getIconForStatus(status),
                                size: 120.w,
                                color: _getStatusColor(status),
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                _getMessageForStatus(status),
                                style: AppTextStyles.heading(context),
                              ),
                            ],
                          );
                        }

                        return Column(
                          children: transactions.map((transaction) {
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
                                    builder: (context) =>
                                        TransactionDetailScreen(
                                      id: transaction['id'],
                                      date: transaction['date'],
                                      total: transaction['total'],
                                      status: status,
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  IconData _getIconForStatus(String status) {
    switch (status.toLowerCase()) {
      case 'menunggu':
        return Icons.access_time;
      case 'diproses':
        return Icons.sync;
      case 'selesai':
        return Icons.check_circle_outline;
      case 'dibatalkan':
        return Icons.cancel_outlined;
      default:
        return Icons.history;
    }
  }

  String _getMessageForStatus(String status) {
    switch (status.toLowerCase()) {
      case 'menunggu':
        return 'Belum ada transaksi menunggu';
      case 'diproses':
        return 'Belum ada transaksi diproses';
      case 'selesai':
        return 'Belum ada transaksi selesai';
      case 'dibatalkan':
        return 'Belum ada transaksi dibatalkan';
      default:
        return 'Belum ada transaksi';
    }
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
        return Colors.red;
      default:
        return Colors.red;
    }
  }
}

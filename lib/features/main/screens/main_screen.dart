import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../features/home/screens/home_screen.dart';
import '../../../features/cart/screens/cart_screen.dart';
import '../../../features/history/screens/history_screen.dart';
import '../../../features/profile/screens/profile_screen.dart';
import '../../../core/constants/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const CartScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _pages.length,
      vsync: this,
    );
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _currentIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (_currentIndex != index) {
      _tabController.animateTo(
        index,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: Container(
        height: isIOS ? 85.h : 65.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (isIOS)
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: _buildNavItem(0, Icons.home_outlined, Icons.home),
              )
            else
              _buildNavItem(0, Icons.home_outlined, Icons.home),
            if (isIOS)
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: _buildNavItem(
                    1, Icons.shopping_cart_outlined, Icons.shopping_cart),
              )
            else
              _buildNavItem(
                  1, Icons.shopping_cart_outlined, Icons.shopping_cart),
            if (isIOS)
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: _buildNavItem(2, Icons.history_outlined, Icons.history),
              )
            else
              _buildNavItem(2, Icons.history_outlined, Icons.history),
            if (isIOS)
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: _buildNavItem(3, Icons.person_outline, Icons.person),
              )
            else
              _buildNavItem(3, Icons.person_outline, Icons.person),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, IconData activeIcon) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 60.w,
        height: 60.w,
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              isSelected ? activeIcon : icon,
              key: ValueKey<bool>(isSelected),
              color: isSelected ? AppColors.primary : Colors.grey,
              size: 28.w,
            ),
          ),
        ),
      ),
    );
  }
}

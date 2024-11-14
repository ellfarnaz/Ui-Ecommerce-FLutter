import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/category_item.dart';
import '../widgets/product_card.dart';
import '../widgets/search_bar.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedCategoryIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.grid_view, 'label': 'Semua'},
    {'icon': Icons.computer, 'label': 'Komputer'},
    {'icon': Icons.memory, 'label': 'Hardware'},
    {'icon': Icons.headphones, 'label': 'Aksesoris'},
  ];

  final Map<int, List<Map<String, dynamic>>> categoryProducts = {
    0: [
      // Semua produk
      {
        'name': 'Headphone JBL Back Mercury',
        'price': 'Rp. 20.000',
        'image':
            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&q=80'
      },
      {
        'name': 'ThinkCentre M720 Desktop',
        'price': 'Rp. 20.000',
        'image':
            'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&q=80'
      },
      {
        'name': 'Lenovo Dekstop',
        'price': 'Rp. 20.000',
        'image':
            'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400&q=80'
      },
      {
        'name': 'ThinkCentre M720 Desktop',
        'price': 'Rp. 20.000',
        'image':
            'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&q=80'
      },
      {
        'name': 'Lenovo Dekstop',
        'price': 'Rp. 20.000',
        'image':
            'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400&q=80'
      },
      {
        'name': 'Headphone JBL Back Mercury',
        'price': 'Rp. 20.000',
        'image':
            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&q=80'
      },
    ],
    1: [
      // Komputer
      {
        'name': 'Lenovo Dekstop',
        'price': 'Rp. 20.000',
        'image':
            'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400&q=80'
      },
      {
        'name': 'ThinkCentre M720 Desktop',
        'price': 'Rp. 20.000',
        'image':
            'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&q=80'
      },
      {
        'name': 'Lenovo Dekstop',
        'price': 'Rp. 20.000',
        'image':
            'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400&q=80'
      },
      {
        'name': 'ThinkCentre M720 Desktop',
        'price': 'Rp. 20.000',
        'image':
            'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&q=80'
      },
    ],
    2: [
      // Hardware
      {
        'name': 'RAM DDR4',
        'price': 'Rp. 20.000',
        'image':
            'https://images.unsplash.com/photo-1562976540-1502c2145186?w=400&q=80'
      },
      {
        'name': 'SSD 512GB',
        'price': 'Rp. 20.000',
        'image':
            'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=400&q=80'
      },
    ],
    3: [
      // Aksesoris
      {
        'name': 'Headphone JBL Back Mercury',
        'price': 'Rp. 20.000',
        'image':
            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&q=80'
      },
      {
        'name': 'Gaming Mouse',
        'price': 'Rp. 20.000',
        'image':
            'https://images.unsplash.com/photo-1527814050087-3793815479db?w=400&q=80'
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    _setupTabController();
  }

  void _setupTabController() {
    _tabController = TabController(length: categories.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedCategoryIndex = _tabController.index;
      });
    });
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Selamat datang, ',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textDark,
                  ),
                ),
                TextSpan(
                  text: 'Ellfarnaz',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          CustomSearchBar(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              categories.length,
              (index) => CategoryItem(
                icon: categories[index]['icon'],
                label: categories[index]['label'],
                isSelected: _selectedCategoryIndex == index,
                onTap: () {
                  setState(() {
                    _selectedCategoryIndex = index;
                    _tabController.animateTo(index);
                  });
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w, bottom: 15.h),
          child: Text(
            'Produk tersedia',
            style: AppTextStyles.heading(context),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 81.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10.r,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 24.w),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined, size: 24.w),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, size: 24.w),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 24.w),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Column(
                  children: [
                    _buildHeader(),
                    _buildCategories(),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: List.generate(categories.length, (pageIndex) {
                          final filteredProducts = _searchQuery.isEmpty
                              ? categoryProducts[pageIndex] ?? []
                              : (categoryProducts[pageIndex] ?? [])
                                  .where((product) {
                                  final name =
                                      product['name'].toString().toLowerCase();
                                  final price =
                                      product['price'].toString().toLowerCase();
                                  final query = _searchQuery.toLowerCase();
                                  return name.contains(query) ||
                                      price.contains(query);
                                }).toList();

                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: filteredProducts.isEmpty
                                ? Center(
                                    child: Text(
                                      'Produk tidak ditemukan',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  )
                                : GridView.builder(
                                    padding: EdgeInsets.only(bottom: 20.h),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          orientation == Orientation.portrait
                                              ? 2
                                              : 4,
                                      childAspectRatio:
                                          orientation == Orientation.portrait
                                              ? 0.8
                                              : 1.0,
                                      crossAxisSpacing: AppSizes.paddingM,
                                      mainAxisSpacing: AppSizes.paddingM,
                                    ),
                                    itemCount: filteredProducts.length,
                                    itemBuilder: (context, index) {
                                      final product = filteredProducts[index];
                                      return ProductCard(
                                        imageUrl: product['image'],
                                        name: product['name'],
                                        price: product['price'],
                                        category: categories[pageIndex]
                                            ['label'],
                                      );
                                    },
                                  ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: _buildBottomNavigationBar(),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}

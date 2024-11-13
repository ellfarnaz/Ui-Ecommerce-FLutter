import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'product_detail_page.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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

  List<Map<String, dynamic>> _getFilteredProducts(int categoryIndex) {
    final products = categoryProducts[categoryIndex] ?? [];
    if (_searchQuery.isEmpty) {
      return products;
    }
    return products.where((product) {
      final name = product['name'].toString().toLowerCase();
      final price = product['price'].toString().toLowerCase();
      final query = _searchQuery.toLowerCase();
      return name.contains(query) || price.contains(query);
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    _tabController = TabController(length: categories.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedCategoryIndex = _tabController.index;
      });
    });
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome Text
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Selamat datang, ',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF181C1D),
                          ),
                        ),
                        TextSpan(
                          text: 'Libur',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF181C1D),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Cari di sini',
                        hintStyle: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.grey),
                        suffixIcon: _searchQuery.isNotEmpty
                            ? IconButton(
                                icon:
                                    const Icon(Icons.clear, color: Colors.grey),
                                onPressed: () {
                                  _searchController.clear();
                                },
                              )
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Category Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      categories.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCategoryIndex = index;
                            _tabController.animateTo(index);
                          });
                        },
                        child: _buildCategoryItem(
                          icon: categories[index]['icon'],
                          label: categories[index]['label'],
                          isSelected: _selectedCategoryIndex == index,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Products Title
                  Text(
                    'Produk tersedia',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF181C1D),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),

            // Products Grid dengan TabBarView
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics:
                    const NeverScrollableScrollPhysics(), // Nonaktifkan scroll
                children: List.generate(categories.length, (pageIndex) {
                  final filteredProducts = _getFilteredProducts(pageIndex);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: filteredProducts.isEmpty
                        ? Center(
                            // Tampilkan pesan jika tidak ada hasil
                            child: Text(
                              'Produk tidak ditemukan',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : GridView.builder(
                            padding: const EdgeInsets.only(bottom: 20),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.8,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ),
                            itemCount: filteredProducts.length,
                            itemBuilder: (context, index) {
                              final product = filteredProducts[index];
                              return _buildProductCard(
                                imageUrl: product['image'],
                                name: product['name'],
                                price: product['price'],
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
      bottomNavigationBar: Container(
        height: 81,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFFFCD65B),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem({
    required IconData icon,
    required String label,
    bool isSelected = false,
  }) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color:
                isSelected ? const Color(0xFFFCD65B) : const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Icon(
              icon,
              color: const Color(0xFF181C1D),
              size: 24,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: const Color(0xFF181C1D),
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard({
    required String imageUrl,
    required String name,
    required String price,
  }) {
    final String uniqueTag =
        'product-$name-${DateTime.now().millisecondsSinceEpoch}';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ProductDetailPage(
              name: name,
              price: price,
              imageUrl: imageUrl,
              category: categories[_selectedCategoryIndex]['label'],
              heroTag: uniqueTag,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 300),
          ),
        );
      },
      child: Hero(
        tag: uniqueTag,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFFFCD65B),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[200],
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Colors.grey,
                            size: 32,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Gambar tidak tersedia',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Product Details
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF181C1D),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      price,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF181C1D),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

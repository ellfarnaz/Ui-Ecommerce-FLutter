import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductDetailScreen extends StatefulWidget {
  final String name;
  final String price;
  final String imageUrl;
  final String category;
  final String heroTag;

  const ProductDetailScreen({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.heroTag,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _isExpanded = false;
  final String _description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut';

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xFF181C1D),
      systemNavigationBarIconBrightness: Brightness.light,
    ));
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: false,
      body: Stack(
        children: [
          // Main Content
          CustomScrollView(
            slivers: [
              // Image Section
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.width,
                pinned: false,
                floating: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFCD65B),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF181C1D),
                      ),
                    ),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: widget.heroTag,
                    child: CachedNetworkImage(
                      imageUrl: widget.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Content Section
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Category Tag
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            widget.category.toUpperCase(),
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF181C1D),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Product Name
                        Text(
                          widget.name,
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF181C1D),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Description with Read More
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _description,
                              maxLines: _isExpanded ? null : 8,
                              overflow:
                                  _isExpanded ? null : TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: const Color(0xFF263238),
                                height: 1.5,
                              ),
                            ),
                            if (!_isExpanded) ...[
                              const SizedBox(height: 8),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isExpanded = true;
                                  });
                                },
                                child: Text(
                                  'Baca selengkapnya',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF181C1D),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Bottom Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: const BoxDecoration(
                color: Color(0xFF181C1D),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'HARGA',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.price,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  // Add to Cart Button
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFCD65B),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        '+ Keranjang',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF181C1D),
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
    );
  }
}

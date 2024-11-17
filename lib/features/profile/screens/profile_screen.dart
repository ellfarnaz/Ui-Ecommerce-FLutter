import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../welcome/screens/welcome_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              // Background kuning yang tetap (tidak ter-scroll)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Container(
                  color: const Color(0xFFFFD93D),
                ),
              ),

              // Konten yang bisa di-scroll
              DefaultTabController(
                length: 1,
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                        sliver: SliverAppBar(
                          automaticallyImplyLeading: false,
                          systemOverlayStyle: const SystemUiOverlayStyle(
                            statusBarColor: Colors.transparent,
                            statusBarIconBrightness: Brightness.dark,
                          ),
                          backgroundColor: innerBoxIsScrolled
                              ? const Color(0xFFFFD93D)
                              : Colors.transparent,
                          pinned: true,
                          centerTitle: true,
                          title: AnimatedOpacity(
                            opacity: innerBoxIsScrolled ? 1.0 : 0,
                            duration: const Duration(milliseconds: 110),
                            child: Text(
                              'Profile',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
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
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context),
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: Column(
                                children: [
                                  // Judul Profile yang tetap
                                  Center(
                                    child: Text(
                                      'Profile',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 24.h),
                                  // Profile Section
                                  Center(
                                    child: Column(
                                      children: [
                                        // Profile Circle
                                        Container(
                                          width: 100.w,
                                          height: 100.w,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'EFZ',
                                              style: TextStyle(
                                                fontSize: 32.sp,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(height: 16.h),

                                        // Name
                                        Text(
                                          'Ellfarnaz',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),

                                        SizedBox(height: 36.h),

                                        // Profile Info Container
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.05),
                                                blurRadius: 10,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              _buildInfoItem(
                                                icon:
                                                    Icons.mail_outline_rounded,
                                                label: 'Email',
                                                value:
                                                    'farelnazhari.22@gmail.com',
                                              ),
                                              _buildDivider(),
                                              _buildInfoItem(
                                                icon: Icons.phone_outlined,
                                                label: 'Nomor Hp',
                                                value: '+6285156820515',
                                              ),
                                              _buildDivider(),
                                              _buildInfoItem(
                                                icon:
                                                    Icons.location_on_outlined,
                                                label: 'Alamat',
                                                value:
                                                    'Jl. Siliwangi Jl. Ring Road Utara, Jombor Lor, Sendangadi, Kec. Mlati, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55285',
                                              ),
                                              _buildDivider(),
                                              _buildInfoItem(
                                                icon: Icons
                                                    .person_outline_rounded,
                                                label: 'Jenis Kelamin',
                                                value: 'Laki-laki',
                                                isLastItem: true,
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Tombol Keluar
                                        Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.only(
                                            top: 40.h,
                                            bottom: MediaQuery.of(context)
                                                    .padding
                                                    .bottom +
                                                24.h,
                                          ),
                                          child: SizedBox(
                                            height: 45.h,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const WelcomeScreen(),
                                                  ),
                                                  (route) => false,
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xFFFFD93D),
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                                padding: EdgeInsets.zero,
                                              ),
                                              child: Text(
                                                'Keluar',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
    bool isLastItem = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 16.h,
        bottom: isLastItem ? 16.h : 16.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 24.w,
            height: 24.w,
            alignment: Alignment.center,
            child: Icon(
              icon,
              size: 24.w,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey[200],
      height: 1,
      thickness: 1,
    );
  }
}

import 'package:belajar_fluttetr/core/utils/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../features/auth/widgets/custom_text_field.dart';
import '../../../features/cart/screens/payment_method_screen.dart';

class RecipientDetailScreen extends StatelessWidget {
  const RecipientDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Menutup keyboard saat menekan area di luar input
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: DefaultTabController(
          length: 1,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    backgroundColor:
                        innerBoxIsScrolled ? AppColors.primary : Colors.white,
                    elevation: innerBoxIsScrolled ? 0.5 : 0,
                    pinned: true,
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                    title: AnimatedOpacity(
                      opacity: innerBoxIsScrolled ? 1.0 : 0,
                      duration: const Duration(milliseconds: 130),
                      child: Text(
                        'Detail Penerima',
                        style: AppTextStyles.heading(context).copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
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
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Detail Penerima',
                              style: AppTextStyles.heading(context).copyWith(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              'Langkah 1 dari 3',
                              style: AppTextStyles.body(context),
                            ),
                            SizedBox(height: 8.h),
                            LinearProgressIndicator(
                              value: 0.33,
                              backgroundColor: Colors.grey[200],
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.amber),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              'Nama Penerima',
                              style: AppTextStyles.body(context),
                            ),
                            SizedBox(height: 8.h),
                            const CustomTextField(
                              hintText: 'Ellfarnaz',
                              prefixIcon: Icons.person_outline,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'Nomor Hp',
                              style: AppTextStyles.body(context),
                            ),
                            SizedBox(height: 8.h),
                            const CustomTextField(
                              hintText: '+628232981479234',
                              prefixIcon: Icons.phone_outlined,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'Provinsi',
                              style: AppTextStyles.body(context),
                            ),
                            SizedBox(height: 8.h),
                            const CustomTextField(
                              hintText: 'Provinsi',
                              prefixIcon: Icons.location_on_outlined,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'Kota / Kabupaten',
                              style: AppTextStyles.body(context),
                            ),
                            SizedBox(height: 8.h),
                            const CustomTextField(
                              hintText: 'Kota / Kabupaten',
                              prefixIcon: Icons.location_city_outlined,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'Alamat Lengkap',
                              style: AppTextStyles.body(context),
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: TextField(
                                maxLines: 4,
                                textAlignVertical: TextAlignVertical.top,
                                style: AppTextStyles.body(context).copyWith(
                                  fontSize: 14.sp,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Jl. xxx, Desa, Kecamatan',
                                  hintStyle:
                                      AppTextStyles.body(context).copyWith(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                  ),
                                  prefixIcon: Container(
                                    alignment: Alignment.center,
                                    width: 40.w,
                                    child: Icon(
                                      Icons.home_outlined,
                                      color: Colors.grey[600],
                                      size: 24.sp,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 16.h,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 40.h),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  SlidePageRoute(
                                    page: const PaymentMethodScreen(),
                                    direction: AxisDirection.left,
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                minimumSize: Size(double.infinity, 50.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.r),
                                ),
                              ),
                              child: Text(
                                'Selanjutnya',
                                style:
                                    AppTextStyles.buttonText(context).copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
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
      ),
    );
  }
}

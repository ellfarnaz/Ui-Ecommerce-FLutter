import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              // Profile Header
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundColor: AppColors.primary,
                      child: Icon(
                        Icons.person_outline,
                        size: 50.w,
                        color: AppColors.textDark,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Nama Pengguna',
                      style: AppTextStyles.heading(context),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'user@email.com',
                      style: AppTextStyles.subtitle(context),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 32.h),

              // Menu Items
              ListTile(
                leading: const Icon(Icons.edit_outlined),
                title: Text(
                  'Edit Profil',
                  style: AppTextStyles.body(context),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Handle edit profile
                },
              ),

              ListTile(
                leading: const Icon(Icons.lock_outline),
                title: Text(
                  'Ubah Password',
                  style: AppTextStyles.body(context),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Handle change password
                },
              ),

              ListTile(
                leading: const Icon(Icons.logout),
                title: Text(
                  'Keluar',
                  style: AppTextStyles.body(context),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Handle logout
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

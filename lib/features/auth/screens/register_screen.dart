import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'personal_data_screen.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_text_field.dart';
import '../../../core/utils/page_transition.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Registrasi'),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                const CustomTextField(
                  hintText: 'Masukkan email anda',
                  prefixIcon: Icons.email_outlined,
                ),
                SizedBox(height: 20.h),
                const CustomTextField(
                  hintText: 'Masukkan kata sandi anda',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                ),
                SizedBox(height: 20.h),
                const CustomTextField(
                  hintText: 'Konfirmasi kata sandi anda',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                ),
                SizedBox(height: 30.h),
                AuthButton(
                  text: 'Selanjutnya',
                  onPressed: () {
                    Navigator.push(
                      context,
                      SlidePageRoute(
                        page: const PersonalDataScreen(),
                        direction: AxisDirection.left,
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(
                      context,
                      SlidePageRoute(
                        page: const LoginScreen(),
                        direction: AxisDirection.right,
                      ),
                    );
                  },
                  child: Text(
                    'Masuk',
                    style: GoogleFonts.poppins(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

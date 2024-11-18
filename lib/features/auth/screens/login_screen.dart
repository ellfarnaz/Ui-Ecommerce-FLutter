import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register_screen.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_text_field.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/page_transition.dart';
import '../../../features/main/screens/main_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Masuk',
          style: AppTextStyles.heading(context),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
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
                SizedBox(height: 30.h),
                AuthButton(
                  text: 'Masuk',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      SlidePageRoute(
                        page: const MainScreen(),
                        direction: AxisDirection.left,
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun? ',
                      style: AppTextStyles.body(context),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          SlidePageRoute(
                            page: const RegisterScreen(),
                            direction: AxisDirection.left,
                          ),
                        );
                      },
                      child: Text(
                        'Registrasi',
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

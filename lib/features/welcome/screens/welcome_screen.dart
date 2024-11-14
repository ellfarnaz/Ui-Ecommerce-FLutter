import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../widgets/welcome_button.dart';
import '../../auth/screens/login_screen.dart';
import '../../auth/screens/register_screen.dart';
import '../../../core/utils/page_transition.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dapatkan ukuran layar
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          // Tambahkan ScrollView untuk menghindari overflow
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Section
                Container(
                  padding: EdgeInsets.all(size.width * 0.05),
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: size.width * 0.3, // Responsive icon size
                    color: AppColors.textDark,
                  ),
                ),

                // Text Section
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1,
                    vertical: size.height * 0.02,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Selamat datang',
                        style: AppTextStyles.heading(context),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        'Belanja dengan percaya diri, karena kami menawarkan berbagai metode pembayaran yang aman dan terjamin.',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.subtitle(context),
                      ),
                    ],
                  ),
                ),

                // Button Section
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1,
                    vertical: size.height * 0.03,
                  ),
                  child: Column(
                    children: [
                      WelcomeButton(
                        text: 'Masuk',
                        onPressed: () => Navigator.push(
                          context,
                          SlidePageRoute(
                            page: const LoginScreen(),
                            direction: AxisDirection.left,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      WelcomeButton(
                        text: 'Registrasi',
                        onPressed: () => Navigator.push(
                          context,
                          SlidePageRoute(
                            page: const RegisterScreen(),
                            direction: AxisDirection.left,
                          ),
                        ),
                        isPrimary: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

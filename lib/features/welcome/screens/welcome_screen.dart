import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../auth/screens/login_screen.dart';
import '../../auth/screens/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
          width: 393,
          height: 852,
          padding: const EdgeInsets.only(top: 207, bottom: 208),
          child: Column(
            children: [
              // Logo Section
              Container(
                height: 147,
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  Icons.account_circle_rounded,
                  size: 127,
                  color: AppColors.textDark,
                ),
              ),

              // Text Section
              Container(
                height: 120,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Text(
                      'Selamat datang',
                      style: AppTextStyles.heading,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Belanja dengan percaya diri, karena kami menawarkan berbagai metode pembayaran yang aman dan terjamin.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.subtitle,
                    ),
                  ],
                ),
              ),

              // Button Section
              Container(
                height: 170,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 30,
                ),
                child: Column(
                  children: [
                    CustomButton(
                      text: 'Masuk',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Registrasi',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
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
    );
  }
}

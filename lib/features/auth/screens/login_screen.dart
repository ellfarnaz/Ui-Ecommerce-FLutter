import 'package:flutter/material.dart';
import 'register_screen.dart';
import '../../../features/home/screens/home_screen.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_text_field.dart';
import '../../../core/constants/app_text_styles.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/page_transition.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Masuk'),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CustomTextField(
              hintText: 'Masukkan email anda',
              prefixIcon: Icons.email_outlined,
            ),
            const SizedBox(height: 20),
            const CustomTextField(
              hintText: 'Masukkan kata sandi anda',
              prefixIcon: Icons.lock_outline,
              obscureText: true,
            ),
            const SizedBox(height: 30),
            AuthButton(
              text: 'Masuk',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const HomeScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;
                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
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
            ),
            const SizedBox(height: 20),
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
                    style: AppTextStyles.getStyle(
                      context,
                      GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

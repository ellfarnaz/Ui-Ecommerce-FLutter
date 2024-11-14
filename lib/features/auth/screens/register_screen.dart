import 'package:flutter/material.dart';
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
            const SizedBox(height: 20),
            const CustomTextField(
              hintText: 'Konfirmasi kata sandi anda',
              prefixIcon: Icons.lock_outline,
              obscureText: true,
            ),
            const SizedBox(height: 30),
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
            const SizedBox(height: 20),
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
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

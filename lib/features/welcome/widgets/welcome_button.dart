import 'package:flutter/material.dart';
import '../../../shared/widgets/custom_button.dart';

class WelcomeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;

  const WelcomeButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      isPrimary: isPrimary,
      height: 45,
    );
  }
}

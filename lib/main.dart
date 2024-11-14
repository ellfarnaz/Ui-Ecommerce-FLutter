import 'package:flutter/material.dart';
import 'core/utils/size_config.dart';
import 'features/welcome/screens/welcome_screen.dart';
import 'core/theme/app_theme.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Mengatur orientasi hanya portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: AppTheme.lightTheme,
      home: Builder(
        builder: (context) {
          SizeConfig().init(context);
          return const WelcomeScreen();
        },
      ),
    );
  }
}

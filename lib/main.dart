import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'core/utils/size_config.dart';
import 'features/welcome/screens/welcome_screen.dart';
import 'core/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'features/cart/providers/cart_provider.dart';
import 'features/main/screens/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: ScreenUtilInit(
        designSize: const Size(392, 825),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'E-Commerce App',
            theme: AppTheme.lightTheme,
            home: const WelcomeScreen(),
            routes: {
              '/main': (context) {
                final args = ModalRoute.of(context)?.settings.arguments
                    as Map<String, dynamic>?;
                final initialIndex = args?['initialIndex'] as int? ?? 0;
                return MainScreen(initialIndex: initialIndex);
              },
            },
          );
        },
      ),
    );
  }
}

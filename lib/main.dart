import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadmarket/shared/app_theme.dart';

import 'features/auth/screens/login_screen.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'firebase_options.dart';
import 'shared/common/loading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: '노마드 마켓',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(), // 라이트 테마
      darkTheme: AppTheme.darkTheme(), // 다크 테마
      themeMode: ThemeMode.system, // 시스템 테마

      home: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else {
            return const OnboardingScreen();
          }
        },
      ),
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) {
            final page = _getPageFromRoute(settings.name!);
            return page;
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = 0.0;
            var end = 1.0;
            var curve = Curves.easeInOut;

            var fadeAnimation = Tween(begin: begin, end: end).animate(
              CurvedAnimation(parent: animation, curve: curve),
            );

            var scaleAnimation = Tween(begin: 0.5, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: curve),
            );

            return FadeTransition(
              opacity: fadeAnimation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
        );
      },
    );
  }

  Widget _getPageFromRoute(String route) {
    switch (route) {
      case '/onboarding':
        return const OnboardingScreen();
      case '/login':
        return const LoginScreen();
      default:
        return const OnboardingScreen();
    }
  }
}

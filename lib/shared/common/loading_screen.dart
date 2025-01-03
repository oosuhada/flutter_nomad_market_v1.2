import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadmarket/features/auth/providers/auth_provider.dart';
import 'package:nomadmarket/shared/common/widgets/loading_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  final List<String> _onboardingImages = [
    'assets/images/onboarding1.png',
    'assets/images/onboarding2.png',
    'assets/images/onboarding3.png',
  ];

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // 이미지 프리캐싱
    await _precacheImages();

    // 최소 5초 로딩 화면 표시
    await Future.delayed(const Duration(seconds: 5));

    if (!mounted) return;

    // 인증 상태 확인
    final user = await ref.read(authProvider.future);

    if (user != null) {
      // 로그인된 상태면 홈화면으로
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // 처음 방문이면 온보딩으로
      final isFirstVisit = await _checkFirstVisit();
      if (isFirstVisit) {
        Navigator.pushReplacementNamed(context, '/onboarding');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  Future<void> _precacheImages() async {
    for (String imagePath in _onboardingImages) {
      await precacheImage(AssetImage(imagePath), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 248, 245),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 200),
            Image.asset(
              'assets/images/logo.PNG',
              width: 250,
              height: 120,
            ),
            const SizedBox(height: 20),
            const Text(
              '내 손안의 글로벌 커머스',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '지금 전 세계 도시를 선택하고 시작해보세요!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 150),
            const LoadingIndicator(),
            const SizedBox(height: 30),
            const Text(
              '데이터를 불러오는 중입니다',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _checkFirstVisit() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstVisit = prefs.getBool('is_first_visit') ?? true;

    if (isFirstVisit) {
      // 첫 방문이 아님을 표시
      await prefs.setBool('is_first_visit', false);
    }

    return isFirstVisit;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadmarket/features/auth/providers/auth_provider.dart';
import 'package:nomadmarket/features/onboarding/providers/onboarding_provider.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../widgets/login_form.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingState = ref.watch(onboardingNotifierProvider);
    final isAndroid = Theme.of(context).platform == TargetPlatform.android;

    Widget buildSocialIcon(SocialLoginButtonType type) {
      switch (type) {
        case SocialLoginButtonType.google:
          return Image.asset(
            'assets/images/logo_google.png',
            width: 38,
            height: 38,
          );
        case SocialLoginButtonType.apple:
          return const Icon(Icons.apple, color: Colors.white, size: 32);
        case SocialLoginButtonType.twitter:
          return Image.asset(
            'assets/images/logo_x.png',
            width: 24,
            height: 24,
            color: Colors.white,
          );
        default:
          return Image.asset(
            'assets/images/logo_facebook.png',
            width: 48,
            height: 43,
          );
      }
    }

    Widget buildSocialButton(bool isAndroid, WidgetRef ref,
        SocialLoginButtonType type, String language,
        {double size = 50}) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: type == SocialLoginButtonType.google
              ? Colors.white
              : type == SocialLoginButtonType.apple
                  ? Colors.black
                  : type == SocialLoginButtonType.twitter
                      ? Colors.black
                      : const Color(0xFF1877F2),
          shape: BoxShape.circle,
          border: type == SocialLoginButtonType.google
              ? Border.all(color: Colors.grey.shade300)
              : null,
        ),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () => ref
              .read(authProvider.notifier)
              .signInWithSocial(type == SocialLoginButtonType.google
                  ? 'google'
                  : type == SocialLoginButtonType.apple
                      ? 'apple'
                      : type == SocialLoginButtonType.twitter
                          ? 'twitter'
                          : 'facebook'),
          child: Center(
            child: buildSocialIcon(type),
          ),
        ),
      );
    }

    Widget buildSocialLoginButtons(String language) {
      final socialButtons = isAndroid
          ? [
              SocialLoginButtonType.google,
              SocialLoginButtonType.twitter,
              SocialLoginButtonType.facebook,
            ]
          : [
              SocialLoginButtonType.google,
              SocialLoginButtonType.apple,
              SocialLoginButtonType.facebook,
            ];

      final buttonSizes = [50.0, 55.0, 50.0]; // 각 버튼의 크기를 직접 설정

      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: socialButtons
              .asMap()
              .map((index, type) => MapEntry(
                    index,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: buildSocialButton(
                        isAndroid,
                        ref,
                        type,
                        language,
                        size: buttonSizes[index],
                      ),
                    ),
                  ))
              .values
              .toList(),
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(60.0), // Increase the height of the AppBar
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Navigate to main screen as guest
              },
              child: Text(
                onboardingState.currentLanguage == 'ko'
                    ? '둘러보기'
                    : onboardingState.currentLanguage == 'ja'
                        ? '見てみる'
                        : 'Browse',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 0),
              Text(
                onboardingState.currentLanguage == 'ko'
                    ? '안녕하세요,\n만나서 반갑습니다'
                    : onboardingState.currentLanguage == 'ja'
                        ? 'こんにちは、\nはじめまして'
                        : 'Hello,\nNice to meet you',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 60),
              buildSocialLoginButtons(onboardingState.currentLanguage),
              const SizedBox(height: 30),
              LoginForm(onboardingState), // 상태 전달
              const SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {
                    // 회원가입 화면으로 이동
                  },
                  child: Text(
                    onboardingState.currentLanguage == 'ko'
                        ? '회원가입하기'
                        : onboardingState.currentLanguage == 'ja'
                            ? '新規登録'
                            : 'Sign Up',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

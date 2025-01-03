// onboarding_page.dart
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingContent content;
  final String currentLanguage;

  const OnboardingPage({
    Key? key,
    required this.content,
    required this.currentLanguage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 120, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              content.mainText[currentLanguage] ?? '',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              content.subText[currentLanguage] ?? '',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.6,
              ),
            ),
            const SizedBox(height: 80),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter, // 이미지를 위쪽으로 정렬
                child: Image.asset(
                  content.image,
                  fit: BoxFit.contain,
                  height: MediaQuery.of(context).size.height *
                      0.35, // 이미지 크기를 화면 높이의 30%로 제한
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingContent {
  final String image;
  final Map<String, String> mainText;
  final Map<String, String> subText;

  OnboardingContent({
    required this.image,
    required this.mainText,
    required this.subText,
  });
}

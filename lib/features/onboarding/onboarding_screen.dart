import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadmarket/features/onboarding/providers/onboarding_provider.dart';
import 'package:nomadmarket/features/onboarding/widgets/language_dropdown.dart';

import 'widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final onboardingState = ref.watch(onboardingNotifierProvider);

        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    ref
                        .read(onboardingNotifierProvider.notifier)
                        .setCurrentPage(page);
                  },
                  itemCount: onboardingState.contents.length,
                  itemBuilder: (context, index) {
                    return OnboardingPage(
                      content: onboardingState.contents[index],
                      currentLanguage: onboardingState.currentLanguage,
                    );
                  },
                ),
                // Language selection dropdown (top left)
                Positioned(
                  top: 20,
                  left: 20,
                  child: LanguageDropdown(
                    currentLanguage: onboardingState.currentLanguage,
                    onChanged: (String? newLanguage) {
                      if (newLanguage != null) {
                        ref
                            .read(onboardingNotifierProvider.notifier)
                            .setCurrentLanguage(newLanguage);
                      }
                    },
                  ),
                ),
                // Skip button (top right)
                Positioned(
                  top: 20,
                  right: 20,
                  child: TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: Text(
                      onboardingState.currentLanguage == 'ko' ? '건너뛰기' : 'Skip',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                // Page indicator with fixed position
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Page indicator
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            onboardingState.contents.length,
                            (index) => buildDot(
                              index: index,
                              currentPage: onboardingState.currentPage,
                            ),
                          ),
                        ),
                      ),
                      // Button
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        height: 80,
                        child: ElevatedButton(
                          onPressed: () {
                            if (onboardingState.currentPage ==
                                onboardingState.contents.length - 1) {
                              Navigator.pushNamed(context, '/login');
                            } else {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: Text(
                            onboardingState.currentPage ==
                                    onboardingState.contents.length - 1
                                ? (onboardingState.currentLanguage == 'ko'
                                    ? '시작하기'
                                    : 'Get Started')
                                : (onboardingState.currentLanguage == 'ko'
                                    ? '다음'
                                    : 'Next'),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildDot({required int index, required int currentPage}) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

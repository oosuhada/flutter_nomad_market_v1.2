import 'package:nomadmarket/features/onboarding/widgets/onboarding_page.dart';

class OnboardingState {
  final int currentPage;
  final String currentLanguage;
  final List<OnboardingContent> contents;

  OnboardingState({
    required this.currentPage,
    required this.currentLanguage,
    required this.contents,
  });

  OnboardingState copyWith({
    int? currentPage,
    String? currentLanguage,
    List<OnboardingContent>? contents,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      currentLanguage: currentLanguage ?? this.currentLanguage,
      contents: contents ?? this.contents,
    );
  }
}

import 'package:nomadmarket/core/entities/onboarding_state.dart';
import 'package:nomadmarket/features/onboarding/widgets/onboarding_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_provider.g.dart';

@riverpod
class OnboardingNotifier extends _$OnboardingNotifier {
  @override
  OnboardingState build() {
    return OnboardingState(
      currentLanguage: 'ko',
      currentPage: 0,
      contents: [
        OnboardingContent(
          image: 'assets/images/onboarding1.png',
          mainText: {
            'ko': '여행자와 구매자를 잇다,\n당신의 노마드 마켓',
            'en': 'Connecting Travelers and Buyers,\nYour Nomad Market',
            'ja': '旅行者と購入者をつなぐ,\nあなたのノマドマーケット',
          },
          subText: {
            'ko': '세계를 연결하는 쇼핑, 가치를 더하는 여행,\n당신의 여행이 누군가의 꿈을 현실로 만듭니다',
            'en':
                'Shopping that connects the world, travel that adds value,\nYour journey makes someone\'s dream come true',
            'ja': '世界をつなぐショッピング、価値を加える旅行、\nあなたの旅が誰かの夢を現実にします',
          },
        ),
        OnboardingContent(
          image: 'assets/images/onboarding2.png',
          mainText: {
            'ko': '현지 쇼핑으로 만나는\n글로벌 쇼핑 경험',
            'en': 'Global Shopping Experience\nthrough Local Shopping',
          },
          subText: {
            'ko': '여행자가 현지에서 직접 구매해 배송료 부담 없이\n전 세계 현지 친구들이 당신의 퍼스널 쇼퍼가 됩니다',
            'en':
                'Travelers purchase directly locally with no shipping burden\nLocal friends worldwide become your personal shoppers',
          },
        ),
        OnboardingContent(
          image: 'assets/images/onboarding3.png',
          mainText: {
            'ko': '구하기 힘든 한정판,\n노마드 마켓에서',
            'en': 'Hard-to-Find Limited Editions,\nat Nomad Market',
          },
          subText: {
            'ko': '해외 현지에서만 구할 수 있는 특별한 상품을 손쉽게\n국경을 넘어 원하는 상품을 편리하게 구매하세요',
            'en':
                'Easily get special items only available locally abroad\nConveniently purchase desired items across borders',
          },
        ),
        OnboardingContent(
          image: 'assets/images/onboarding4.png',
          mainText: {
            'ko': '여행의 즐거움에\n수익과 연결을 더하다',
            'en': 'Adding Profit and Connection\nto the Joy of Travel',
          },
          subText: {
            'ko': '여행하면서 간편하게 부가 수입 창출까지\n당신의 여행 가방은 이제 글로벌 마켓플레이스',
            'en':
                'Easily generate additional income while traveling\nYour travel bag is now a global marketplace',
          },
        ),
        OnboardingContent(
          image: 'assets/images/onboarding5.png',
          mainText: {
            'ko': '안전한 거래,\n믿을 수 있는 플랫폼',
            'en': 'Safe Transactions,\nTrusted Platform',
          },
          subText: {
            'ko': '안전한 에스크로 결제와 검증된 매칭 시스템으로\n신뢰할 수 있는 안전거래를 경험하세요',
            'en':
                'Experience reliable safe transactions with\nsecure escrow payments and verified matching system',
          },
        ),
        OnboardingContent(
          image: 'assets/images/onboarding6.png',
          mainText: {
            'ko': '해외쇼핑을 넘어선\n글로벌 문화 교류의 장',
            'en': 'Beyond Shopping:\nA Global Cultural Exchange',
          },
          subText: {
            'ko': '전 세계 여행자와 구매자를 연결하는 글로벌 커뮤니티\n한국 문화의 숨은 보석을 전 세계에 연결합니다',
            'en':
                'A global community connecting worldwide travelers and buyers\nConnecting Korean culture\'s hidden gems to the world',
          },
        ),
      ],
    );
  }

  void setCurrentPage(int page) {
    state = state.copyWith(currentPage: page);
  }

  void setCurrentLanguage(String language) {
    state = state.copyWith(currentLanguage: language);
  }
}

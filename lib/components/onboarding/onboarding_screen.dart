import 'package:flutter/material.dart';

import 'widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingContent> _pages = [
    OnboardingContent(
      image: 'assets/images/onboarding1.png',
      title: 'Welcome',
      description: '글로벌 쇼핑의 새로운 경험',
      subDescription: '전 세계 여행자들과 함께하는\n크로스보더 쇼핑 플랫폼',
    ),
    OnboardingContent(
      image: 'assets/images/onboarding2.png',
      title: 'Welcome',
      description: '글로벌 쇼핑의 새로운 경험',
      subDescription: '전 세계 여행자들과 함께하는\n크로스보더 쇼핑 플랫폼',
    ),
    OnboardingContent(
      image: 'assets/images/onboarding3.png',
      title: '전 세계 여행자들과 함께하는\n글로벌 쇼핑',
      description: '',
      subDescription: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return OnboardingPage(content: _pages[index]);
            },
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                    (index) => buildDot(index: index),
                  ),
                ),
                const SizedBox(height: 20),
                if (_currentPage == _pages.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to login screen
                    },
                    child: const Text('시작하기'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot({required int index}) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

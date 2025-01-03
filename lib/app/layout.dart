import 'package:flutter/material.dart';
import 'package:nomadmarket/components/common/app_bar.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  final bool showBottomNav;

  const AppLayout({
    Key? key,
    required this.child,
    this.showBottomNav = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: child),
      bottomNavigationBar: showBottomNav
          ? const CustomBottomNavBar(
              currentIndex: 0,
              onTap: _onBottomNavTap,
            )
          : null,
    );
  }

  void _onBottomNavTap(int index) {
    // 네비게이션 처리
  }
}

// lib/components/auth/auth_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/validators.dart';
import '../../providers/auth_provider.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/custom_text_field.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLogin = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 로고
                const SizedBox(height: 48),
                Image.asset(
                  'assets/images/logo.png',
                  height: 80,
                ),
                const SizedBox(height: 48),

                // 환영 메시지
                Text(
                  _isLogin ? '안녕하세요,' : '처음 오셨나요?',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  _isLogin ? '다시 만나서 반가워요!' : '간단한 회원가입 후 시작해보세요.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(height: 32),

                // 이메일 입력
                CustomTextField(
                  controller: _emailController,
                  hintText: '이메일을 입력해주세요',
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.email,
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                const SizedBox(height: 16),

                // 비밀번호 입력
                CustomTextField(
                  controller: _passwordController,
                  hintText: '비밀번호를 입력해주세요',
                  obscureText: true,
                  validator: Validators.password,
                  prefixIcon: const Icon(Icons.lock_outlined),
                ),
                const SizedBox(height: 24),

                // 로그인/회원가입 버튼
                if (authState.isLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  CustomButton(
                    onPressed: _handleSubmit,
                    text: _isLogin ? '로그인' : '회원가입',
                  ),

                // 모드 전환 버튼
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                  child: Text(
                    _isLogin ? '계정이 없으신가요? 회원가입' : '이미 계정이 있으신가요? 로그인',
                  ),
                ),

                // 소셜 로그인 버튼들
                const SizedBox(height: 24),
                const Text(
                  '또는',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                _buildSocialLoginButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLoginButtons() {
    return Column(
      children: [
        // Google 로그인
        CustomButton(
          onPressed: _handleGoogleSignIn,
          text: 'Google로 계속하기',
          icon: Image.asset(
            'assets/icons/google.png',
            height: 24,
          ),
          backgroundColor: Colors.white,
          textColor: Colors.black,
          borderColor: Colors.grey[300],
        ),
        const SizedBox(height: 12),
        // Apple 로그인
        CustomButton(
          onPressed: _handleAppleSignIn,
          text: 'Apple로 계속하기',
          icon: const Icon(Icons.apple, color: Colors.black),
          backgroundColor: Colors.white,
          textColor: Colors.black,
          borderColor: Colors.grey[300],
        ),
      ],
    );
  }

  Future<void> _handleSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (_isLogin) {
        await ref.read(authProvider.notifier).login(
              _emailController.text,
              _passwordController.text,
            );
      } else {
        await ref.read(authProvider.notifier).register(
              _emailController.text,
              _passwordController.text,
            );
      }
    }
  }

  Future<void> _handleGoogleSignIn() async {
    await ref.read(authProvider.notifier).signInWithGoogle();
  }

  Future<void> _handleAppleSignIn() async {
    await ref.read(authProvider.notifier).signInWithApple();
  }
}

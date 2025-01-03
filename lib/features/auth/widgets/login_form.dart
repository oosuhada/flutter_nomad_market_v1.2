import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm(this.onboardingState, {Key? key}) : super(key: key);

  final dynamic onboardingState; // 전달받은 상태

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: '이메일',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '이메일을 입력해주세요';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: '비밀번호',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '비밀번호를 입력해주세요';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                value: false, // 자동 로그인 상태를 관리하는 변수로 변경해야 합니다
                onChanged: (bool? value) {
                  // 자동 로그인 상태 변경 로직
                },
              ),
              Text(
                widget.onboardingState.currentLanguage == 'ko'
                    ? '자동 로그인'
                    : widget.onboardingState.currentLanguage == 'ja'
                        ? '自動ログイン'
                        : 'Auto Login',
                style: const TextStyle(color: Colors.grey),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // 비밀번호 찾기 화면으로 이동
                },
                child: Text(
                  widget.onboardingState.currentLanguage == 'ko'
                      ? '비밀번호 찾기'
                      : widget.onboardingState.currentLanguage == 'ja'
                          ? 'パスワードを忘れた場合'
                          : 'Forgot Password',
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Perform login
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: const Text('로그인'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

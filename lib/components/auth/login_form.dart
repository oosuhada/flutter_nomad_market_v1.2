import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Function(String, String) onLogin;
  final VoidCallback onRegisterTap;

  LoginForm({
    Key? key,
    required this.onLogin,
    required this.onRegisterTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 32),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: '이메일',
              hintText: '이메일을 입력해주세요',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: '비밀번호',
              hintText: '비밀번호를 입력해주세요',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () => onLogin(
                emailController.text,
                passwordController.text,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('로그인'),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: onRegisterTap,
            child: const Text('계정이 없으신가요? 회원가입'),
          ),
        ],
      ),
    );
  }
}

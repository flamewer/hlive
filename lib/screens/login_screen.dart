import 'package:flutter/material.dart';
import 'main_app.dart';
import '../widgets/custom_button.dart';
import '../theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _emailController.text = 'ericangelo1503@gmail.com';
  }

  InputDecoration _buildInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(color: Colors.blue, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(color: Colors.blue, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),

            // 欢迎标题
            const Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Log in to your Placoo account to explore your dream place to live across the whole world!',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.textSecondary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),

            // 邮箱输入框
            Text(
              'Username',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppTheme.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _emailController,
              decoration: _buildInputDecoration('Enter your username or email'),
            ),
            const SizedBox(height: 16),

            // 密码输入框
            Text(
              'Password',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppTheme.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: _buildInputDecoration('Enter your password').copyWith(
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppTheme.textTertiary,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 登录按钮
            CustomButton(
              text: 'Log in',
              onPressed: () {
                if (_emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MainApp()),
                    (route) => false,
                  );
                }
              },
              isPrimary: true,
              borderRadius: 50.0,
              height: 56.0,
            ),
            const SizedBox(height: 16),

            // 忘记密码
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  // 忘记密码逻辑
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(color: AppTheme.primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 分割线
            Row(
              children: [
                Expanded(child: Divider(color: AppTheme.borderColor)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.textTertiary,
                    ),
                  ),
                ),
                Expanded(child: Divider(color: AppTheme.borderColor)),
              ],
            ),
            const SizedBox(height: 24),

            // 社交登录按钮
            _buildSocialButton(
              'Sign in with Apple',
              Icons.apple,
              onPressed: () {
                // Apple登录逻辑
              },
              backgroundColor: Colors.black,
              textColor: Colors.white,
            ),
            const SizedBox(height: 12),
            _buildSocialButton(
              'Sign in with Google',
              Icons.g_mobiledata,
              onPressed: () {
                // Google登录逻辑
              },
              backgroundColor: Colors.white,
              textColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    String text,
    IconData icon, {
    VoidCallback? onPressed,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: const BorderSide(color: AppTheme.borderColor),
        ),
        backgroundColor: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: textColor ?? AppTheme.textPrimary, size: 20),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: textColor ?? AppTheme.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

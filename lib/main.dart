import 'package:flutter/material.dart';
import 'package:hlive/theme/app_theme.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const HliveApp());
}

class HliveApp extends StatelessWidget {
  const HliveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hlive',
      theme: AppTheme.lightTheme,
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
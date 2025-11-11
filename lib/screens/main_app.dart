import 'package:flutter/material.dart';
import 'package:hlive/screens/home_screen.dart';
import 'package:hlive/screens/video_player.dart';
import 'explore_screen.dart';
import 'chat_screen.dart';
import 'profile_screen.dart';
import '../widgets/bottom_nav_bar.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 1;

  final List<Widget> _screens = [
    // Home Screen (占位符)
    HomeScreen(),
    // Explore Screen
    const ExploreScreen(),
    // Chat Screen
    ChatScreen(),
    // Saved Screen (占位符)
    VideoPlayerScreen(),
    // Profile Screen
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/user.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final User currentUser = User(
    name: 'Lucy Bond',
    email: 'lucybond08@gmail.com',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const _StatusBar(),
            const SizedBox(height: 24),
            // 用户头像和信息
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.surfaceColor,
              ),
              child: Icon(Icons.person, size: 40, color: Colors.grey[400]),
            ),
            const SizedBox(height: 16),
            Text(
              currentUser.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              currentUser.email,
              style: const TextStyle(
                fontSize: 14,
                color: AppTheme.textSecondary,
              ),
            ),
            const SizedBox(height: 32),
            // 菜单项
            _buildMenuItem('Personal details', Icons.person_outline),
            _buildMenuItem('Settings', Icons.settings_outlined),
            _buildMenuItem('Payment details', Icons.credit_card_outlined),
            _buildMenuItem('FAQ', Icons.help_outline),
            _buildMenuItem('Switch to hosting', Icons.home_work_outlined),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppTheme.borderColor)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppTheme.textPrimary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
        ],
      ),
    );
  }
}

class _StatusBar extends StatelessWidget {
  const _StatusBar();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '9:41',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            Icon(Icons.signal_cellular_4_bar, size: 16),
            SizedBox(width: 4),
            Icon(Icons.wifi, size: 16),
            SizedBox(width: 4),
            Icon(Icons.battery_std, size: 16),
          ],
        ),
      ],
    );
  }
}
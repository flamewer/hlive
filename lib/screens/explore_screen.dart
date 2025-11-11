import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: AppTheme.surfaceColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                size: 20,
                color: AppTheme.textTertiary,
              ),
              hintText: 'Search address, city, location',
              hintStyle: const TextStyle(color: AppTheme.textTertiary),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 下一个旅行目的地
            _buildSectionHeader(context, 'Find your next trip', 'See all'),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                  child: DestinationCard(
                    destination: 'Bali, Indonesia',
                    properties: '345 rented props',
                    imageColor: Color(0xFFFFE8E9),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: DestinationCard(
                    destination: 'Yogyakarta, Indonesia',
                    properties: '290 rented props',
                    imageColor: Color(0xFFE8F4FF),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 生活风格探索
            _buildSectionHeader(context, 'Explore by living style', 'See all'),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                  child: LivingStyleCard(
                    title: 'Outdoor living',
                    icon: Icons.forest_rounded,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: LivingStyleCard(
                    title: 'Japanese housing',
                    icon: Icons.temple_buddhist_rounded,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 其他体验
            _buildSectionHeader(
              context,
              'Want to discover other experiences',
              'See all',
            ),
            const SizedBox(height: 16),
            const Column(
              children: [
                ExperienceCard(
                  title: 'Learn the culture',
                  description: 'Learn about local culture and customs',
                ),
                SizedBox(height: 12),
                ExperienceCard(
                  title: 'Online events',
                  description: 'Join virtual events and meetups',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    String action,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        TextButton(
          onPressed: () {
            // 查看全部逻辑
          },
          child: const Text(
            'See all',
            style: TextStyle(color: AppTheme.primaryColor),
          ),
        ),
      ],
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String destination;
  final String properties;
  final Color imageColor;

  const DestinationCard({
    super.key,
    required this.destination,
    required this.properties,
    required this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        color: AppTheme.surfaceColor,
        boxShadow: [AppTheme.cardShadow],
      ),
      child: Stack(
        children: [
          // 图片区域
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 80,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppTheme.borderRadiusMedium),
                  topRight: Radius.circular(AppTheme.borderRadiusMedium),
                ),
                color: imageColor,
              ),
              child: Icon(
                Icons.location_on_rounded,
                color: AppTheme.primaryColor,
                size: 40,
              ),
            ),
          ),
          // 文字信息
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    properties,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LivingStyleCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const LivingStyleCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        color: AppTheme.surfaceColor,
        boxShadow: [AppTheme.cardShadow],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppTheme.primaryColor, size: 32),
          const SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String title;
  final String description;

  const ExperienceCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        color: AppTheme.surfaceColor,
        boxShadow: [AppTheme.cardShadow],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.primaryColor.withOpacity(0.1),
            ),
            child: Icon(
              Icons.emoji_events_rounded,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(description, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: AppTheme.textTertiary),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../widgets/custom_button.dart';
import '../theme/app_theme.dart';

// Small gallery item model and sample data (use local assets).
class _GalleryItem {
  final String assetPath;
  final int crossAxisCellCount;
  final int mainAxisCellCount;

  const _GalleryItem({
    required this.assetPath,
    required this.crossAxisCellCount,
    required this.mainAxisCellCount,
  });
}

final List<_GalleryItem> _galleryItems = const [
  // Using local assets (lib/asset/Image11.png ... Image33.png). Sizes chosen to create a collage.
  _GalleryItem(
    assetPath: 'lib/asset/Image11.png',
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
  ),
  _GalleryItem(
    assetPath: 'lib/asset/Image12.png',
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
  ),
  _GalleryItem(
    assetPath: 'lib/asset/Image13.png',
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
  ),
  _GalleryItem(
    assetPath: 'lib/asset/Image21.png',
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
  ),
  _GalleryItem(
    assetPath: 'lib/asset/Image22.png',
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
  ),
  _GalleryItem(
    assetPath: 'lib/asset/Image23.png',
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
  ),
  _GalleryItem(
    assetPath: 'lib/asset/Image31.png',
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
  ),
  _GalleryItem(
    assetPath: 'lib/asset/Image32.png',
    crossAxisCellCount: 2,
    mainAxisCellCount: 1,
  ),
  _GalleryItem(
    assetPath: 'lib/asset/Image33.png',
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
  ),
];

class _GalleryTile extends StatelessWidget {
  final _GalleryItem item;
  const _GalleryTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
      child: Container(
        color: AppTheme.surfaceColor,
        child: Image.asset(
          item.assetPath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: AppTheme.surfaceColor,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),

              // Top collage container (staggered gallery inside a rounded card)
              Stack(
                children: [
                  Container(
                    height: 508,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        AppTheme.borderRadiusLarge,
                      ),
                      border: Border.all(
                        color: AppTheme.primaryColor.withOpacity(0.12),
                        width: 3,
                      ),
                      boxShadow: [AppTheme.cardShadow],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppTheme.borderRadiusLarge,
                      ),
                      child: Stack(
                        children: [
                          // Custom responsive wrap-based collage (avoids external staggered grid runtime issues)
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                final double availableWidth =
                                    constraints.maxWidth;
                                final double spacing = 12.0;
                                final double tileWidth =
                                    (availableWidth - 2 * spacing) / 3;

                                return GridView.count(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: spacing,
                                  mainAxisSpacing: spacing,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  children: _galleryItems.map((item) {
                                    return _GalleryTile(item: item);
                                  }).toList(),
                                );
                              },
                            ),
                          ),

                          // overlay mask on top (overlay.png should be semi-transparent mask)
                          Positioned.fill(
                            child: Image.asset(
                              'lib/asset/overlay.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 标题部分 - 重叠在Stack上
                  Positioned(
                    left: 0,
                    right: 0,
                    top: -100, // 调整文字位置到Stack下方
                    child: Column(
                      children: [
                        const Text(
                          'New Place, New Home!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textPrimary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Are you ready to uproot and start over in a new area? Placoo will help you on your journey!',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.textSecondary,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Spacer(),

              // 按钮部分
              CustomButton(
                text: 'Log in',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                isPrimary: true,
                borderRadius: 28.0,
                height: 56.0,
              ),
              const SizedBox(height: 12),
              CustomButton(
                text: 'Sign up',
                onPressed: () {
                  // 注册逻辑
                },
                isPrimary: false,
                borderRadius: 28.0,
                height: 56.0,
              ),
              const SizedBox(height: 18),

              // small bottom indicator (like the design)
              Center(
                child: Container(
                  width: 72,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppTheme.borderColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

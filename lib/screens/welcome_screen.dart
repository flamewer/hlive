import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../widgets/custom_button.dart';
import '../theme/app_theme.dart';

// Small gallery item model and sample data (use local assets).
class _GalleryItem {
  final String assetPath;
  final int crossAxisCellCount;
  final int mainAxisCellCount;
  final double height;

  const _GalleryItem({
    required this.assetPath,
    required this.crossAxisCellCount,
    required this.mainAxisCellCount,
    required this.height,
  });
}

final List<_GalleryItem> _galleryItems = const [
  // Using local assets (lib/asset/Image11.png ... Image33.png). Sizes chosen to create a collage.
  // _GalleryItem(
  //   assetPath: 'lib/asset/Image11.png',
  //   crossAxisCellCount: 1,
  //   mainAxisCellCount: 2,
  //   height: 130,
  // ),
  // _GalleryItem(
  //   assetPath: 'lib/asset/Image12.png',
  //   crossAxisCellCount: 1,
  //   mainAxisCellCount: 2,
  //   height: 140,
  // ),
  // _GalleryItem(
  //   assetPath: 'lib/asset/Image13.png',
  //   crossAxisCellCount: 1,
  //   mainAxisCellCount: 2,
  //   height: 175,
  // ),
  // _GalleryItem(
  //   assetPath: 'lib/asset/Image21.png',
  //   crossAxisCellCount: 1,
  //   mainAxisCellCount: 1,
  //   height: 175,
  // ),
  // _GalleryItem(
  //   assetPath: 'lib/asset/Image22.png',
  //   crossAxisCellCount: 1,
  //   mainAxisCellCount: 1,
  //   height: 130,
  // ),
  // _GalleryItem(
  //   assetPath: 'lib/asset/Image23.png',
  //   crossAxisCellCount: 1,
  //   mainAxisCellCount: 1,
  //   height: 140,
  // ),
  // _GalleryItem(
  //   assetPath: 'lib/asset/Image31.png',
  //   crossAxisCellCount: 1,
  //   mainAxisCellCount: 2,
  //   height: 175,
  // ),
  // _GalleryItem(
  //   assetPath: 'lib/asset/Image32.png',
  //   crossAxisCellCount: 2,
  //   mainAxisCellCount: 1,
  //   height: 140,
  // ),
  // _GalleryItem(
  //   assetPath: 'lib/asset/Image33.png',
  //   crossAxisCellCount: 1,
  //   mainAxisCellCount: 1,
  //   height: 175,
  // ),
  _GalleryItem(
    assetPath: 'lib/asset/1olumn.png',
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
    height: 463,
  ),
  _GalleryItem(
    assetPath: 'lib/asset/2olumn.png',
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
    height: 463,
  ),
  _GalleryItem(
    assetPath: 'lib/asset/3olumn.png',
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
    height: 508,
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
        height: item.height,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Fixed height background image section
            Container(
              height: 500, // Fixed height for background image section
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: 508,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(AppTheme.borderRadiusLarge),
                        bottomRight: Radius.circular(
                          AppTheme.borderRadiusLarge,
                        ),
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
                                final double spacing = 10.0;
                                final double tileWidth =
                                    (availableWidth - 2 * spacing) / 3;

                                return GridView.count(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: spacing,
                                  mainAxisSpacing: spacing,
                                  childAspectRatio:
                                      tileWidth / constraints.maxHeight,
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
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 300,
              child:
                  // Fixed height text and buttons section
                  Container(
                    height:
                        MediaQuery.of(context).size.height -
                        500, // Remaining height
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          SizedBox(height: 20),
                          // Buttons section
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
                        ],
                      ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

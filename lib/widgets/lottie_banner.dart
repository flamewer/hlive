// 在ExploreScreen类外部添加以下代码

import 'package:flutter/material.dart';
import 'package:hlive/models/component/banner_component.dart';
import 'package:hlive/theme/app_theme.dart';
import 'package:lottie/lottie.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LottieBannerComponent extends StatelessWidget {
  final BannerComponent bannerComponent;

  const LottieBannerComponent({super.key, required this.bannerComponent});

  // 判断是否为Lottie动画文件
  bool _isLottieFile(String? url) {
    if (url == null || url.isEmpty) return false;
    return url.toLowerCase().endsWith('.json');
  }

  @override
  Widget build(BuildContext context) {
    // 获取BannerComponent中的SlotList数据
    final slots = bannerComponent.slotList ?? [];

    if (slots.isEmpty) {
      return Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          color: AppTheme.surfaceColor,
        ),
        child: const Center(child: Text('No banner data available')),
      );
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
      items: slots.map((slot) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppTheme.borderRadiusMedium,
                ),
                color: AppTheme.surfaceColor,
                boxShadow: [AppTheme.cardShadow],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppTheme.borderRadiusMedium,
                ),
                child: _buildBannerContent(slot.image), // 根据资源类型选择展示方式
              ),
            );
          },
        );
      }).toList(),
    );
  }

  // 根据资源类型构建Banner内容
  Widget _buildBannerContent(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return Container(
        color: AppTheme.primaryColor.withOpacity(0.1),
        child: const Icon(
          Icons.image_not_supported_outlined,
          size: 50,
          color: AppTheme.primaryColor,
        ),
      );
    }

    if (_isLottieFile(imageUrl)) {
      // Lottie动画
      return Lottie.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, exception, stackTrace) {
          return Container(
            color: AppTheme.primaryColor.withOpacity(0.1),
            child: const Icon(
              Icons.animation_outlined,
              size: 50,
              color: AppTheme.primaryColor,
            ),
          );
        },
      );
    } else {
      // 静态图片
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: AppTheme.primaryColor.withOpacity(0.1),
            child: const Icon(
              Icons.broken_image_outlined,
              size: 50,
              color: AppTheme.primaryColor,
            ),
          );
        },
      );
    }
  }
}

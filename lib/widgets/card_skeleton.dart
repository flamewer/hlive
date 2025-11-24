// lib/widgets/card_skeleton.dart
import 'package:flutter/material.dart';
import 'package:hlive/widgets/skeleton_loader.dart';
import '../theme/app_theme.dart';

class CardSkeleton extends StatelessWidget {
  final double height;
  final bool hasImage;
  final int textLines;

  const CardSkeleton({
    super.key,
    this.height = 180,
    this.hasImage = true,
    this.textLines = 2,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerSkeleton(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          color: AppTheme.surfaceColor,
        ),
        child: Stack(
          children: [
            if (hasImage)
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
                    color: Colors.grey[300],
                  ),
                ),
              ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    textLines,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                        bottom: index == textLines - 1 ? 0 : 8,
                      ),
                      child: SkeletonLoader(
                        height: index == 0 ? 16 : 12,
                        width: index == 0 ? 120 : 80,
                      ),
                    ),
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

class ErrorDisplay extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const ErrorDisplay({super.key, required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        color: AppTheme.surfaceColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 40),
          const SizedBox(height: 8),
          Text('加载失败', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            message,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 16),
            ElevatedButton(onPressed: onRetry, child: const Text('重新加载')),
          ],
        ],
      ),
    );
  }
}

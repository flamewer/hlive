import 'package:flutter/material.dart';
import 'package:hlive/models/component/title_component.dart';
import 'package:hlive/theme/app_theme.dart';

class TitleComponentCard extends StatelessWidget {
  final TitleComponent titleComponent;

  const TitleComponentCard({super.key, required this.titleComponent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        color: AppTheme.surfaceColor,
        boxShadow: [AppTheme.cardShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleComponent.title ?? '',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            titleComponent.description ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

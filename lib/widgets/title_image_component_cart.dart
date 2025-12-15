import 'package:flutter/material.dart';
import 'package:hlive/models/component/title_image_component.dart';
import 'package:hlive/theme/app_theme.dart';

class TitleImageHorizontalComponent extends StatelessWidget {
  final TitleImageComponent titleImageComponent;
  final double height;

  const TitleImageHorizontalComponent({
    super.key,
    required this.titleImageComponent,
    this.height = 200.0,
  });

  // 在 build 方法之前添加
  Color? _parseColor(String? colorString) {
    if (colorString == null || colorString.isEmpty) return null;

    try {
      // 处理十六进制颜色 (#RRGGBB 或 #RRGGBBAA)
      if (colorString.startsWith('#')) {
        final hexString = colorString.substring(1);
        final buffer = StringBuffer();
        buffer.write('0xFF');

        if (hexString.length == 6) {
          // RGB 格式
          buffer.write(hexString);
        } else if (hexString.length == 8) {
          // ARGB 格式，需要重新排列为 RGBA
          buffer.write(hexString.substring(0, 6));
          buffer.write(hexString.substring(6, 8));
        } else {
          return null;
        }

        return Color(int.parse(buffer.toString()));
      }
      // 处理 rgba(r,g,b,a) 格式
      else if (colorString.startsWith('rgba(') && colorString.endsWith(')')) {
        final values = colorString
            .substring(5, colorString.length - 1)
            .split(',')
            .map((e) => e.trim())
            .toList();

        if (values.length == 4) {
          final r = int.parse(values[0]);
          final g = int.parse(values[1]);
          final b = int.parse(values[2]);
          final a = (double.parse(values[3]) * 255).round();

          return Color.fromARGB(a, r, g, b);
        }
      }
      // 处理 rgb(r,g,b) 格式
      else if (colorString.startsWith('rgb(') && colorString.endsWith(')')) {
        final values = colorString
            .substring(4, colorString.length - 1)
            .split(',')
            .map((e) => e.trim())
            .toList();

        if (values.length == 3) {
          final r = int.parse(values[0]);
          final g = int.parse(values[1]);
          final b = int.parse(values[2]);

          return Color.fromARGB(255, r, g, b);
        }
      }

      return null;
    } catch (e) {
      // 解析失败时返回 null，使用默认颜色
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final slots = titleImageComponent.slotList ?? [];

    if (slots.isEmpty) {
      return Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          color: AppTheme.surfaceColor,
        ),
        child: const Center(child: Text('No data available')),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 组件标题
        if (titleImageComponent.componentName != null &&
            titleImageComponent.componentName!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              titleImageComponent.componentName!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:
                    _parseColor(titleImageComponent.componentNameColor) ??
                    AppTheme.primaryColor,
              ),
            ),
          ),
        // 横向滚动列表
        SizedBox(
          height: height,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: slots.map((slot) {
              return Container(
                width: 150,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusMedium,
                  ),
                  color: AppTheme.surfaceColor,
                  boxShadow: [AppTheme.cardShadow],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 图片区域
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(AppTheme.borderRadiusMedium),
                        ),
                        child: slot.image != null && slot.image!.isNotEmpty
                            ? Image.network(
                                slot.image!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value:
                                              loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: AppTheme.primaryColor.withOpacity(
                                      0.1,
                                    ),
                                    child: const Icon(
                                      Icons.image_not_supported,
                                      color: AppTheme.primaryColor,
                                    ),
                                  );
                                },
                              )
                            : Container(
                                color: AppTheme.primaryColor.withOpacity(0.1),
                                child: const Icon(
                                  Icons.image_outlined,
                                  color: AppTheme.primaryColor,
                                ),
                              ),
                      ),
                    ),
                    // 标题区域
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        slot.title ?? '',
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

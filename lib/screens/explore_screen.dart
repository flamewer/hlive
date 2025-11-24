import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hlive/models/api_response.dart';
import 'package:hlive/models/component/banner_component.dart';
import 'package:hlive/models/component/base_component.dart';
import 'package:hlive/models/component/component_factory.dart';
import 'package:hlive/models/component/title_component.dart';
import 'package:hlive/widgets/card_skeleton.dart';
import '../theme/app_theme.dart';

Future<List<BaseComponent>> fetchComponents() async {
  final dio = Dio();

  try {
    Map<String, dynamic> queryParameters = {
      'pageId': '1988812370386714625',
      'pageVersion': 5,
      'application': 'phomemo',
      'lang': 'en-us',
      'model': 'M08F-WS',
      'userId': 'tddsa',
      'version': '1.0.0',
      'page': 1,
      'page_size': 10,
    };
    dio.options.queryParameters = queryParameters;
    final response = await dio.get('http://192.168.137.1:5002/api/page/fetch');

    if (response.statusCode == 200) {
      final apiResponse = ApiResponse<List<BaseComponent>>.fromJson(
        response.data,
        (data) {
          if (data is List) {
            return data
                .map((item) {
                  if (item is Map<String, dynamic>) {
                    return ComponentFactory.createComponent(item);
                  }
                  return item;
                })
                .toList()
                .cast<BaseComponent>();
          }
          return <BaseComponent>[];
        },
      );
      if (apiResponse.isSuccess) {
        return apiResponse.data!;
      } else {
        throw Exception('API Error: ${apiResponse.msg}');
      }
    } else {
      throw Exception('Failed to load album');
    }
  } on DioException catch (e) {
    throw Exception('Network Error: ${e.message}');
  }
}

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late Future<List<BaseComponent>> futureComponents;

  @override
  void initState() {
    super.initState();
    futureComponents = fetchComponents();
  }

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
      body: FutureBuilder<List<BaseComponent>>(
        future: futureComponents,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildSectionHeader(context, 'Explore', ''),
                const SizedBox(height: 16),
                CardSkeleton(),
              ],
            );
          }
          if (snapshot.hasError) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildSectionHeader(context, 'Explore', ''),
                const SizedBox(height: 16),
                ErrorDisplay(
                  message: snapshot.error.toString(),
                  onRetry: () {
                    setState(() {
                      futureComponents = fetchComponents();
                    });
                  },
                ),
              ],
            );
          }
          final components = snapshot.data!;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildSectionHeader(context, 'Components', ''),
              const SizedBox(height: 16),
              ...components
                  .map((component) => _buildComponentWidget(component))
                  .toList(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildComponentWidget(BaseComponent component) {
    // 根据不同组件类型构建不同的 UI
    if (component is BannerComponent) {
      // 处理 Banner 组件
      return DestinationCard(
        destination: component.componentName,
        properties: component.componentType,
        imageColor: AppTheme.primaryColor,
      );
    } else if (component is TitleComponent) {
      // 处理标题组件
      return DestinationCard(
        destination: component.componentName,
        properties: component.componentType,
        imageColor: AppTheme.secondaryColor,
      );
    } else {
      // 默认处理
      return DestinationCard(
        destination: component.componentName,
        properties: component.componentType,
        imageColor: AppTheme.textTertiary,
      );
    }
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

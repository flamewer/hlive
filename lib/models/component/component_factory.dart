// lib/models/component/component_factory.dart
import 'base_component.dart';
import 'banner_component.dart';
import 'title_component.dart';
import 'subscription_component.dart';
import 'title_image_component.dart';

class ComponentFactory {
  static dynamic createComponent(Map<String, dynamic> json) {
    final baseComponent = BaseComponent.fromJson(json);
    final componentType = baseComponent.componentType;

    switch (componentType) {
      case "0": // Banner组件
        return BannerComponent.fromBaseComponent(baseComponent);
      case "1": // 标题组件
        return TitleComponent.fromBaseComponent(baseComponent);
      case "2": // 订阅组件
        return SubscriptionComponent.fromBaseComponent(baseComponent);
      case "3": // 标题图片组件
        return TitleImageComponent.fromBaseComponent(baseComponent);
      default:
        return baseComponent;
    }
  }
}

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
        return BannerComponent.fromJson(json);
      case "1": // 标题组件
        return TitleComponent.fromJson(json);
      case "2": // 订阅组件
        return SubscriptionComponent.fromJson(json);
      case "3":
      case "4":
      case "5":
      case "6":
      case "8":
      case "12": // 标题图片组件
        return TitleImageComponent.fromJson(json);
      default:
        return baseComponent;
    }
  }
}

// lib/models/component/banner_component.dart
import 'package:hlive/models/component/base_component.dart';

// lib/models/component/subscription_component.dart
class SubscriptionComponent extends BaseComponent {
  SubscriptionComponent({
    required super.id,
    required super.pageId,
    super.myComponentId,
    required super.componentName,
    required super.componentNameHide,
    super.componentStyle,
    required super.componentSort,
    required super.componentType,
    super.componentVersion,
    required super.componentNameColor,
    required super.slotList,
    super.height,
    super.intersect,
  }) : super();

  factory SubscriptionComponent.fromBaseComponent(BaseComponent base) {
    return SubscriptionComponent(
      id: base.id,
      pageId: base.pageId,
      myComponentId: base.myComponentId,
      componentName: base.componentName,
      componentNameHide: base.componentNameHide,
      componentStyle: base.componentStyle,
      componentSort: base.componentSort,
      componentType: base.componentType,
      componentVersion: base.componentVersion,
      componentNameColor: base.componentNameColor,
      slotList: base.slotList,
      height: base.height,
      intersect: base.intersect,
    );
  }
}

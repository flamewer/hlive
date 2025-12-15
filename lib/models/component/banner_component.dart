// lib/models/component/banner_component.dart
import 'package:hlive/models/component/base_component.dart';
import 'package:hlive/models/slot/base_slot.dart';

class BannerComponent extends BaseComponent {
  BannerComponent({
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
  }) : super();

  factory BannerComponent.fromJson(Map<String, dynamic> json) {
    return BannerComponent(
      id: json['id'] as String,
      pageId: json['pageId'] as String,
      myComponentId: json['myComponentId'] as String?,
      componentName: json['componentName'] as String,
      componentNameHide: json['componentNameHide'] as bool,
      componentStyle: json['componentStyle'] as String?,
      componentSort: json['componentSort'] as int,
      componentType: json['componentType'] as String,
      componentVersion: json['componentVersion'] as String?,
      componentNameColor: json['componentNameColor'] as String,
      slotList: (json['slotList'] as List)
          .map((item) => Slot.fromJson(item as Map<String, dynamic>))
          .toList(),
      height: json['height'],
    );
  }
}

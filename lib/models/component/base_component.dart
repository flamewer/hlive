// lib/models/component/base_component.dart
import 'package:hlive/models/slot/base_slot.dart';

class BaseComponent {
  final String id;
  final String pageId;
  final String? myComponentId;
  final String componentName;
  final bool componentNameHide;
  final String? componentStyle;
  final int componentSort;
  final String componentType;
  final String? componentVersion;
  final String componentNameColor;
  final List<Slot> slotList;
  final dynamic height;
  final bool? intersect;
  final bool? pagerHide;

  BaseComponent({
    required this.id,
    required this.pageId,
    this.myComponentId,
    required this.componentName,
    required this.componentNameHide,
    this.componentStyle,
    required this.componentSort,
    required this.componentType,
    this.componentVersion,
    required this.componentNameColor,
    required this.slotList,
    this.height,
    this.intersect,
    this.pagerHide,
  });

  factory BaseComponent.fromJson(Map<String, dynamic> json) {
    return BaseComponent(
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
      intersect: json['intersect'] as bool?,
      pagerHide: json['pagerHide'] as bool?,
    );
  }
}

// lib/models/component/banner_component.dart
import 'package:hlive/models/component/base_component.dart';
import 'package:hlive/models/slot/base_slot.dart';

// lib/models/component/title_image_component.dart
class TitleImageComponent extends BaseComponent {
  final int? height;
  final bool? intersect;
  final String? detailEntranceJumpUrl;
  final bool? detailEntranceHide;
  final String? detailEntranceJumpUrlType;
  TitleImageComponent({
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
    this.height,
    this.intersect,
    super.pagerHide,
    this.detailEntranceHide,
    this.detailEntranceJumpUrl,
    this.detailEntranceJumpUrlType,
  }) : super();

  factory TitleImageComponent.fromJson(Map<String, dynamic> json) {
    return TitleImageComponent(
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
      detailEntranceJumpUrl: json['detailEntranceJumpUrl'] as String?,
      detailEntranceHide: json['detailEntranceHide'] as bool?,
      detailEntranceJumpUrlType: json['detailEntranceJumpUrlType'] as String?,
    );
  }
}

// lib/models/component/banner_component.dart
import 'package:hlive/models/component/base_component.dart';

// lib/models/component/title_image_component.dart
class TitleImageComponent extends BaseComponent {
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
    super.height,
    super.intersect,
    super.pagerHide,
    super.detailEntranceHide,
    super.detailEntranceJumpUrl,
    super.detailEntranceJumpUrlType,
  }) : super();

  factory TitleImageComponent.fromBaseComponent(BaseComponent base) {
    return TitleImageComponent(
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
      pagerHide: base.pagerHide,
      detailEntranceHide: base.detailEntranceHide,
      detailEntranceJumpUrl: base.detailEntranceJumpUrl,
      detailEntranceJumpUrlType: base.detailEntranceJumpUrlType,
    );
  }
}

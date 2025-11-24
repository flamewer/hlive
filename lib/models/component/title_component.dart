// lib/models/component/banner_component.dart
import 'package:hlive/models/component/base_component.dart';

// lib/models/component/title_component.dart
class TitleComponent extends BaseComponent {
  TitleComponent({
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

  factory TitleComponent.fromBaseComponent(BaseComponent base) {
    return TitleComponent(
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

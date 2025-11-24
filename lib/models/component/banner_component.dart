// lib/models/component/banner_component.dart
import 'package:hlive/models/component/base_component.dart';

class BannerComponent extends BaseComponent {
  final int? stopTime;
  final int? height;

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
    this.stopTime,
    this.height,
  }) : super();

  factory BannerComponent.fromBaseComponent(BaseComponent base) {
    return BannerComponent(
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
      stopTime: base.stopTime,
      height: base.height as int?,
    );
  }
}

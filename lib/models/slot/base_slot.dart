// lib/models/component/slot.dart
class Slot {
  final String id;
  final String? myComponentId;
  final int sort;
  final String? title;
  final String? titleColor;
  final bool titleHide;
  final String? description;
  final String? descriptionColor;
  final bool? descriptionHide;
  final String image;
  final String imageName;
  final String? detailEntranceJumpUrlType;
  final dynamic detailEntranceJumpUrl;
  final String? materialSource;
  final String? materialSourceId;
  final String? seqId;
  final int? seq;
  final bool? isVip;

  Slot({
    required this.id,
    this.myComponentId,
    required this.sort,
    this.title,
    this.titleColor,
    required this.titleHide,
    required this.description,
    this.descriptionColor,
    this.descriptionHide,
    required this.image,
    required this.imageName,
    this.detailEntranceJumpUrlType,
    this.detailEntranceJumpUrl,
    this.materialSource,
    this.materialSourceId,
    this.seqId,
    this.seq,
    this.isVip,
  });

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
      id: json['id'] as String,
      myComponentId: json['myComponentId'] as String?,
      sort: json['sort'] as int,
      title: json['title'] as String?,
      titleColor: json['titleColor'] as String?,
      titleHide: json['titleHide'] as bool? ?? false,
      description: json['description'] as String?,
      descriptionColor: json['descriptionColor'] as String?,
      descriptionHide: json['descriptionHide'] as bool?,
      image: json['image'] as String,
      imageName: json['imageName'] as String,
      detailEntranceJumpUrlType: json['detailEntranceJumpUrlType'] as String?,
      detailEntranceJumpUrl: json['detailEntranceJumpUrl'],
      materialSource: json['materialSource'] as String?,
      materialSourceId: json['materialSourceId'] as String?,
      seqId: json['seqId'] as String?,
      seq: json['seq'] as int?,
      isVip: json['isVip'] as bool?,
    );
  }
}

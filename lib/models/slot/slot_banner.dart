class SlotBanner {
  String url;
  String title;
  String image;
  String description;
  SlotBanner(this.url, this.title, this.image, this.description);
  factory SlotBanner.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "url": var url,
        "title": var title,
        "image": var image,
        "description": var description,
      } =>
        SlotBanner(url, title, image, description),
      _ => throw ArgumentError("Invalid json"),
    };
  }
}

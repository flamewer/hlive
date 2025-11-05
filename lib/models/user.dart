class User {
  final String name;
  final String email;
  final String? avatarUrl;

  User({required this.name, required this.email, this.avatarUrl});
}

class Message {
  final String senderName;
  final String preview;
  final String timestamp;
  final int unreadCount;
  final bool isRead;

  Message({
    required this.senderName,
    required this.preview,
    required this.timestamp,
    this.unreadCount = 0,
    this.isRead = true,
  });
}

class Trip {
  final String location;
  final String propertiesCount;
  final String imageUrl;

  Trip({
    required this.location,
    required this.propertiesCount,
    required this.imageUrl,
  });
}
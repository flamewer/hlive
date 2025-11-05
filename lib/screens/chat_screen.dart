import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/user.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final List<Message> messages = [
    Message(
      senderName: 'Kari Rasmussen',
      preview: 'Thanks for contacting me!',
      timestamp: '15:23',
      unreadCount: 2,
      isRead: false,
    ),
    Message(
      senderName: 'Anita Cruz',
      preview: 'Your payment was accepted.',
      timestamp: 'Yesterday',
      isRead: true,
    ),
    Message(
      senderName: 'Noah Pierre',
      preview: 'It was great experience!',
      timestamp: '11/10/2021',
      isRead: true,
    ),
    Message(
      senderName: 'Lucy Bond',
      preview: 'How much does it cost?',
      timestamp: '11/10/2021',
      isRead: true,
    ),
    Message(
      senderName: 'Louise Vuitton',
      preview: 'Sure, man!',
      timestamp: '11/10/2021',
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: AppTheme.surfaceColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, size: 20),
              hintText: 'Search messages',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return MessageTile(message: message);
        },
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final Message message;

  const MessageTile({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.surfaceColor,
            ),
            child: Icon(Icons.person, color: Colors.grey[400]),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      message.senderName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: message.isRead ? FontWeight.normal : FontWeight.bold,
                      ),
                    ),
                    Text(
                      message.timestamp,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.textTertiary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message.preview,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          if (message.unreadCount > 0) ...[
            const SizedBox(width: 8),
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.unreadIndicator,
              ),
              child: Center(
                child: Text(
                  message.unreadCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../core/services/mock_data_service.dart';

// Màn hình thông báo
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy mock data
    final notifications = MockDataService.getMockNotifications();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: _getNotificationColor(notification.type),
              child: Icon(
                _getNotificationIcon(notification.type),
                color: Colors.white,
              ),
            ),
            title: Text(notification.title),
            subtitle: Text(
              notification.content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              _getNotificationTime(notification.createdAt),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            onTap: () {
              // TODO: Handle notification tap
            },
          ),
        );
      },
    );
  }

  Color _getNotificationColor(String type) {
    switch (type) {
      case 'general':
        return Colors.blue;
      case 'assignment':
        return Colors.green;
      case 'grade':
        return Colors.orange;
      case 'event':
        return Colors.purple;
      case 'message':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getNotificationIcon(String type) {
    switch (type) {
      case 'general':
        return Icons.notifications;
      case 'assignment':
        return Icons.assignment;
      case 'grade':
        return Icons.grade;
      case 'event':
        return Icons.event;
      case 'message':
        return Icons.message;
      default:
        return Icons.notifications;
    }
  }

  String _getNotificationTime(DateTime createdAt) {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} phút trước';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} giờ trước';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ngày trước';
    } else {
      return '${createdAt.day}/${createdAt.month}/${createdAt.year}';
    }
  }
} 
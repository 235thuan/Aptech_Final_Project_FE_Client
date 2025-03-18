import 'package:flutter/material.dart';

// Màn hình thông báo
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 10, // Số lượng thông báo mẫu
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: _getNotificationColor(index),
              child: Icon(
                _getNotificationIcon(index),
                color: Colors.white,
              ),
            ),
            title: Text(_getNotificationTitle(index)),
            subtitle: Text(
              _getNotificationContent(index),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              _getNotificationTime(index),
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

  Color _getNotificationColor(int index) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.purple,
    ];
    return colors[index % colors.length];
  }

  IconData _getNotificationIcon(int index) {
    final icons = [
      Icons.notifications,
      Icons.assignment,
      Icons.grade,
      Icons.event,
      Icons.message,
    ];
    return icons[index % icons.length];
  }

  String _getNotificationTitle(int index) {
    final titles = [
      'Thông báo mới',
      'Bài tập mới',
      'Điểm số đã được cập nhật',
      'Sự kiện sắp tới',
      'Tin nhắn mới',
    ];
    return titles[index % titles.length];
  }

  String _getNotificationContent(int index) {
    final contents = [
      'Có một thông báo mới từ giáo viên',
      'Bài tập môn học đã được đăng',
      'Điểm số của bạn đã được cập nhật',
      'Có một sự kiện sắp diễn ra',
      'Bạn có tin nhắn mới từ bạn học',
    ];
    return contents[index % contents.length];
  }

  String _getNotificationTime(int index) {
    final times = [
      '5 phút trước',
      '1 giờ trước',
      '2 giờ trước',
      '1 ngày trước',
      '2 ngày trước',
    ];
    return times[index % times.length];
  }
} 
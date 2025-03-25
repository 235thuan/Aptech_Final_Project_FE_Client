import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../bloc/notification/notification_bloc.dart';
// import '../../../bloc/notification/notification_event.dart';
// import '../../../bloc/notification/notification_state.dart';
import '../../../core/models/notification.dart';
import '../../../core/services/mock_data_service.dart';

// Màn hình quản lý thông báo cho admin
class NotificationManagementScreen extends StatefulWidget {
  const NotificationManagementScreen({super.key});

  @override
  State<NotificationManagementScreen> createState() => _NotificationManagementScreenState();
}

class _NotificationManagementScreenState extends State<NotificationManagementScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String _selectedType = 'general';
  String _selectedPriority = 'normal';
  List<String> _selectedRecipients = [];

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _showAddNotificationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm thông báo'),
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Tiêu đề'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tiêu đề';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _contentController,
                  decoration: const InputDecoration(labelText: 'Nội dung'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập nội dung';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedType,
                  decoration: const InputDecoration(labelText: 'Loại thông báo'),
                  items: const [
                    DropdownMenuItem(value: 'general', child: Text('Thông báo chung')),
                    DropdownMenuItem(value: 'course', child: Text('Thông báo khóa học')),
                    DropdownMenuItem(value: 'class', child: Text('Thông báo lớp học')),
                    DropdownMenuItem(value: 'event', child: Text('Thông báo sự kiện')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedPriority,
                  decoration: const InputDecoration(labelText: 'Độ ưu tiên'),
                  items: const [
                    DropdownMenuItem(value: 'low', child: Text('Thấp')),
                    DropdownMenuItem(value: 'normal', child: Text('Bình thường')),
                    DropdownMenuItem(value: 'high', child: Text('Cao')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedPriority = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                const Text('Người nhận:'),
                Wrap(
                  spacing: 8.0,
                  children: [
                    FilterChip(
                      label: const Text('Tất cả'),
                      selected: _selectedRecipients.contains('all'),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedRecipients = ['all'];
                          } else {
                            _selectedRecipients.remove('all');
                          }
                        });
                      },
                    ),
                    FilterChip(
                      label: const Text('Học sinh'),
                      selected: _selectedRecipients.contains('student'),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedRecipients.add('student');
                            _selectedRecipients.remove('all');
                          } else {
                            _selectedRecipients.remove('student');
                          }
                        });
                      },
                    ),
                    FilterChip(
                      label: const Text('Giáo viên'),
                      selected: _selectedRecipients.contains('teacher'),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedRecipients.add('teacher');
                            _selectedRecipients.remove('all');
                          } else {
                            _selectedRecipients.remove('teacher');
                          }
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // TODO: Implement add notification functionality
                Navigator.pop(context);
              }
            },
            child: const Text('Gửi'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Sử dụng mock data thay vì gọi API
    final mockNotifications = MockDataService.getMockNotifications();

    // Tính số lượng thông báo theo loại
    Map<String, int> notificationCounts = {
      'general': mockNotifications.where((n) => n.type == 'general').length,
      'course': mockNotifications.where((n) => n.type == 'course').length,
      'class': mockNotifications.where((n) => n.type == 'class').length,
      'event': mockNotifications.where((n) => n.type == 'event').length,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý thông báo'),
      ),
      body: Column(
        children: [
          // Tổng quan thông báo
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Thống kê thông báo',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildNotificationCountCard('Thông báo chung', notificationCounts['general']!, Colors.blue),
                      _buildNotificationCountCard('Thông báo khóa học', notificationCounts['course']!, Colors.green),
                      _buildNotificationCountCard('Thông báo lớp học', notificationCounts['class']!, Colors.orange),
                      _buildNotificationCountCard('Thông báo sự kiện', notificationCounts['event']!, Colors.purple),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Danh sách thông báo
          Expanded(
            child: ListView.builder(
              itemCount: mockNotifications.length,
              itemBuilder: (context, index) {
                final notification = mockNotifications[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: _getTypeColor(notification.type),
                      child: Icon(
                        _getTypeIcon(notification.type),
                        color: Colors.white,
                      ),
                    ),
                    title: Text(notification.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Loại: ${_getTypeText(notification.type)}'),
                        Text('Ngày tạo: ${notification.createdAt}'),
                      ],
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nội dung: ${notification.content}'),
                            const SizedBox(height: 8),
                            Text('Độ ưu tiên: ${_getPriorityText(notification.priority)}'),
                            Text('Người nhận: ${_getRecipientsText(notification.recipients)}'),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    // TODO: Implement edit notification functionality
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    // TODO: Implement delete notification functionality
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddNotificationDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildNotificationCountCard(String title, int count, Color color) {
    return Card(
      margin: const EdgeInsets.only(right: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'general':
        return Colors.blue;
      case 'course':
        return Colors.green;
      case 'class':
        return Colors.orange;
      case 'event':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type) {
      case 'general':
        return Icons.notifications;
      case 'course':
        return Icons.book;
      case 'class':
        return Icons.class_;
      case 'event':
        return Icons.event;
      default:
        return Icons.help;
    }
  }

  String _getTypeText(String type) {
    switch (type) {
      case 'general':
        return 'Thông báo chung';
      case 'course':
        return 'Thông báo khóa học';
      case 'class':
        return 'Thông báo lớp học';
      case 'event':
        return 'Thông báo sự kiện';
      default:
        return 'Không xác định';
    }
  }

  String _getPriorityText(String priority) {
    switch (priority) {
      case 'low':
        return 'Thấp';
      case 'normal':
        return 'Bình thường';
      case 'high':
        return 'Cao';
      default:
        return 'Không xác định';
    }
  }

  String _getRecipientsText(List<String> recipients) {
    if (recipients.contains('all')) {
      return 'Tất cả';
    }
    return recipients.map((r) {
      switch (r) {
        case 'student':
          return 'Học sinh';
        case 'teacher':
          return 'Giáo viên';
        default:
          return 'Không xác định';
      }
    }).join(', ');
  }
} 
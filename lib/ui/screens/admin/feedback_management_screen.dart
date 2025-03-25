import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../bloc/feedback/feedback_bloc.dart';
// import '../../../bloc/feedback/feedback_event.dart';
// import '../../../bloc/feedback/feedback_state.dart';
import '../../../core/models/user_feedback.dart';
import '../../../core/services/mock_data_service.dart';

// Màn hình quản lý phản hồi cho admin
class FeedbackManagementScreen extends StatefulWidget {
  const FeedbackManagementScreen({super.key});

  @override
  State<FeedbackManagementScreen> createState() => _FeedbackManagementScreenState();
}

class _FeedbackManagementScreenState extends State<FeedbackManagementScreen> {
  final _formKey = GlobalKey<FormState>();
  final _responseController = TextEditingController();
  String _selectedStatus = 'pending';

  @override
  void dispose() {
    _responseController.dispose();
    super.dispose();
  }

  void _showResponseDialog(UserFeedback feedback) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Phản hồi'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _responseController,
                decoration: const InputDecoration(labelText: 'Nội dung phản hồi'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập nội dung phản hồi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedStatus,
                decoration: const InputDecoration(labelText: 'Trạng thái'),
                items: const [
                  DropdownMenuItem(value: 'pending', child: Text('Chờ xử lý')),
                  DropdownMenuItem(value: 'in_progress', child: Text('Đang xử lý')),
                  DropdownMenuItem(value: 'resolved', child: Text('Đã giải quyết')),
                  DropdownMenuItem(value: 'rejected', child: Text('Từ chối')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedStatus = value!;
                  });
                },
              ),
            ],
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
                // TODO: Implement respond to feedback functionality
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
    final mockFeedbacks = MockDataService.getMockFeedbacks();

    // Tính số lượng phản hồi theo trạng thái
    Map<String, int> feedbackCounts = {
      'pending': mockFeedbacks.where((f) => f.status == 'pending').length,
      'in_progress': mockFeedbacks.where((f) => f.status == 'in_progress').length,
      'resolved': mockFeedbacks.where((f) => f.status == 'resolved').length,
      'rejected': mockFeedbacks.where((f) => f.status == 'rejected').length,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý phản hồi'),
      ),
      body: Column(
        children: [
          // Tổng quan phản hồi
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Thống kê phản hồi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFeedbackCountCard('Chờ xử lý', feedbackCounts['pending']!, Colors.orange),
                      _buildFeedbackCountCard('Đang xử lý', feedbackCounts['in_progress']!, Colors.blue),
                      _buildFeedbackCountCard('Đã giải quyết', feedbackCounts['resolved']!, Colors.green),
                      _buildFeedbackCountCard('Từ chối', feedbackCounts['rejected']!, Colors.red),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Danh sách phản hồi
          Expanded(
            child: ListView.builder(
              itemCount: mockFeedbacks.length,
              itemBuilder: (context, index) {
                final feedback = mockFeedbacks[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: _getStatusColor(feedback.status),
                      child: Icon(
                        _getStatusIcon(feedback.status),
                        color: Colors.white,
                      ),
                    ),
                    title: Text(feedback.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Người gửi: ${feedback.userName}'),
                        Text('Ngày gửi: ${feedback.createdAt.day}/${feedback.createdAt.month}/${feedback.createdAt.year}'),
                      ],
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nội dung: ${feedback.content}'),
                            if (feedback.response != null) ...[
                              const SizedBox(height: 8),
                              Text('Phản hồi: ${feedback.response}'),
                              Text('Ngày phản hồi: ${feedback.respondedAt!.day}/${feedback.respondedAt!.month}/${feedback.respondedAt!.year}'),
                            ],
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (feedback.status == 'pending')
                                  ElevatedButton.icon(
                                    onPressed: () => _showResponseDialog(feedback),
                                    icon: const Icon(Icons.reply),
                                    label: const Text('Phản hồi'),
                                  ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    // TODO: Implement delete feedback functionality
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
    );
  }

  Widget _buildFeedbackCountCard(String title, int count, Color color) {
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

  Color _getStatusColor(String status) {
    switch (status) {
      case 'pending':
        return Colors.orange;
      case 'in_progress':
        return Colors.blue;
      case 'resolved':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'pending':
        return Icons.schedule;
      case 'in_progress':
        return Icons.refresh;
      case 'resolved':
        return Icons.check_circle;
      case 'rejected':
        return Icons.cancel;
      default:
        return Icons.help;
    }
  }
} 
import 'package:flutter/material.dart';
import '../../../core/models/user_feedback.dart';
import '../../../core/services/mock_data_service.dart';

// Màn hình phản hồi cho giáo viên
class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  final _responseController = TextEditingController();
  String _selectedStatus = 'approved';

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
                  DropdownMenuItem(value: 'approved', child: Text('Đã xử lý')),
                  DropdownMenuItem(value: 'pending', child: Text('Đang xử lý')),
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
                // TODO: Implement feedback response functionality
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Phản hồi'),
      ),
      body: ListView.builder(
        itemCount: mockFeedbacks.length,
        itemBuilder: (context, index) {
          final feedback = mockFeedbacks[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ExpansionTile(
              title: Text(feedback.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Từ: ${feedback.userName}'),
                  Text('Thời gian: ${feedback.createdAt.day}/${feedback.createdAt.month}/${feedback.createdAt.year}'),
                  Text('Trạng thái: ${feedback.status}'),
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
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 16),
                        Text('Phản hồi: ${feedback.response}'),
                      ],
                      const SizedBox(height: 16),
                      if (feedback.response == null)
                        ElevatedButton(
                          onPressed: () => _showResponseDialog(feedback),
                          child: const Text('Phản hồi'),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
} 
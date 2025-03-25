import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../bloc/discussion/discussion_bloc.dart';
// import '../../../bloc/discussion/discussion_event.dart';
// import '../../../bloc/discussion/discussion_state.dart';
import '../../../core/models/discussion.dart';
import '../../../core/services/mock_data_service.dart';

// Màn hình thảo luận cho giáo viên
class DiscussionScreen extends StatefulWidget {
  const DiscussionScreen({super.key});

  @override
  State<DiscussionScreen> createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String _selectedClass = '';

  @override
  void initState() {
    super.initState();
    // Sử dụng mock data thay vì gọi API
    final mockClasses = MockDataService.getMockClasses();
    if (mockClasses.isNotEmpty) {
      _selectedClass = mockClasses[0].name;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _showCreateDiscussionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tạo chủ đề thảo luận mới'),
        content: Form(
          key: _formKey,
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
                // TODO: Implement create discussion functionality
                Navigator.pop(context);
              }
            },
            child: const Text('Tạo'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Sử dụng mock data thay vì gọi API
    final mockDiscussions = MockDataService.getMockDiscussions();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thảo luận'),
      ),
      body: ListView.builder(
        itemCount: mockDiscussions.length,
        itemBuilder: (context, index) {
          final discussion = mockDiscussions[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
              title: Text(discussion.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Lớp: ${discussion.className}'),
                  Text('Tác giả: ${discussion.authorName}'),
                  Text('Thời gian: ${discussion.createdAt.day}/${discussion.createdAt.month}/${discussion.createdAt.year}'),
                ],
              ),
              trailing: Text('${discussion.replyCount} trả lời'),
              onTap: () {
                // TODO: Navigate to discussion detail screen
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreateDiscussionDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
} 
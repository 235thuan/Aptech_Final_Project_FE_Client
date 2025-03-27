import 'package:flutter/material.dart';
// import '../../../bloc/document/document_bloc.dart';
// import '../../../bloc/document/document_event.dart';
// import '../../../bloc/document/document_state.dart';
import '../../../core/services/mock_data_service.dart';

// Màn hình quản lý tài liệu cho admin
class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedType = 'pdf';
  String _selectedCategory = 'course';
  String _selectedCourse = '';
  DateTime _selectedUploadDate = DateTime.now();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _showAddDocumentDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm tài liệu'),
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
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Mô tả'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mô tả';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedType,
                  decoration: const InputDecoration(labelText: 'Loại tài liệu'),
                  items: const [
                    DropdownMenuItem(value: 'pdf', child: Text('PDF')),
                    DropdownMenuItem(value: 'doc', child: Text('Word')),
                    DropdownMenuItem(value: 'ppt', child: Text('PowerPoint')),
                    DropdownMenuItem(value: 'video', child: Text('Video')),
                    DropdownMenuItem(value: 'image', child: Text('Hình ảnh')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: const InputDecoration(labelText: 'Danh mục'),
                  items: const [
                    DropdownMenuItem(value: 'course', child: Text('Khóa học')),
                    DropdownMenuItem(value: 'assignment', child: Text('Bài tập')),
                    DropdownMenuItem(value: 'exam', child: Text('Đề thi')),
                    DropdownMenuItem(value: 'guide', child: Text('Hướng dẫn')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedCourse,
                  decoration: const InputDecoration(labelText: 'Khóa học'),
                  items: MockDataService.getMockCourses().map((course) {
                    return DropdownMenuItem(
                      value: course.name,
                      child: Text(course.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCourse = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: const Text('Ngày tải lên'),
                  subtitle: Text(
                    '${_selectedUploadDate.day}/${_selectedUploadDate.month}/${_selectedUploadDate.year}',
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _selectedUploadDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (date != null) {
                      setState(() {
                        _selectedUploadDate = date;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Implement file picker functionality
                  },
                  icon: const Icon(Icons.upload_file),
                  label: const Text('Chọn tệp'),
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
                // TODO: Implement add document functionality
                Navigator.pop(context);
              }
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Sử dụng mock data thay vì gọi API
    final mockDocuments = MockDataService.getMockDocuments();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý tài liệu'),
      ),
      body: ListView.builder(
        itemCount: mockDocuments.length,
        itemBuilder: (context, index) {
          final document = mockDocuments[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ExpansionTile(
              title: Text(document.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Loại: ${document.type}'),
                  Text('Danh mục: ${document.category}'),
                ],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mô tả: ${document.description}'),
                      Text('Khóa học: ${document.courseName}'),
                      Text('Ngày tải lên: ${document.uploadDate.day}/${document.uploadDate.month}/${document.uploadDate.year}'),
                      Text('Kích thước: ${document.size}'),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.download),
                            onPressed: () {
                              // TODO: Implement download functionality
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // TODO: Implement edit document functionality
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // TODO: Implement delete document functionality
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
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDocumentDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
} 
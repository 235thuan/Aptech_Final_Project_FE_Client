import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../bloc/learning_material/learning_material_bloc.dart';
// import '../../../bloc/learning_material/learning_material_event.dart';
// import '../../../bloc/learning_material/learning_material_state.dart';
import '../../../core/models/learning_material.dart';
import '../../../core/services/mock_data_service.dart';

// Màn hình tài liệu học tập cho giáo viên
class LearningMaterialScreen extends StatefulWidget {
  const LearningMaterialScreen({super.key});

  @override
  State<LearningMaterialScreen> createState() => _LearningMaterialScreenState();
}

class _LearningMaterialScreenState extends State<LearningMaterialScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedClass = '';
  String _selectedType = 'Tài liệu';

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
    _descriptionController.dispose();
    super.dispose();
  }

  void _showAddMaterialDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm tài liệu'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedClass,
                decoration: const InputDecoration(labelText: 'Lớp'),
                items: MockDataService.getMockClasses().map((classItem) {
                  return DropdownMenuItem(
                    value: classItem.name,
                    child: Text(classItem.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedClass = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedType,
                decoration: const InputDecoration(labelText: 'Loại tài liệu'),
                items: const [
                  DropdownMenuItem(value: 'Tài liệu', child: Text('Tài liệu')),
                  DropdownMenuItem(value: 'Bài tập', child: Text('Bài tập')),
                  DropdownMenuItem(value: 'Video', child: Text('Video')),
                  DropdownMenuItem(value: 'Link', child: Text('Link')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedType = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
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
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Implement file upload functionality
                },
                icon: const Icon(Icons.upload_file),
                label: const Text('Tải lên tệp'),
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
                // TODO: Implement add material functionality
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
    final mockMaterials = MockDataService.getMockLearningMaterials();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tài liệu học tập'),
      ),
      body: ListView.builder(
        itemCount: mockMaterials.length,
        itemBuilder: (context, index) {
          final material = mockMaterials[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ExpansionTile(
              title: Text(material.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Lớp: ${material.className}'),
                  Text('Loại: ${material.type}'),
                  Text('Thời gian: ${material.uploadedAt.day}/${material.uploadedAt.month}/${material.uploadedAt.year}'),
                ],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mô tả: ${material.description}'),
                      if (material.fileUrl != null) ...[
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () {
                            // TODO: Implement file download functionality
                          },
                          icon: const Icon(Icons.download),
                          label: const Text('Tải xuống'),
                        ),
                      ],
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // TODO: Implement edit material functionality
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // TODO: Implement delete material functionality
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
        onPressed: _showAddMaterialDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
} 
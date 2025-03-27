import 'package:flutter/material.dart';
import '../../../core/services/mock_data_service.dart';

// Màn hình quản lý điểm cho giáo viên
class GradeManagementScreen extends StatefulWidget {
  const GradeManagementScreen({super.key});

  @override
  State<GradeManagementScreen> createState() => _GradeManagementScreenState();
}

class _GradeManagementScreenState extends State<GradeManagementScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scoreController = TextEditingController();
  final _commentController = TextEditingController();
  String _selectedClass = '';
  String _selectedStudent = '';
  String _selectedAssignment = '';

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
    _scoreController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _showAddGradeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm điểm'),
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
                value: _selectedStudent,
                decoration: const InputDecoration(labelText: 'Học sinh'),
                items: const [
                  DropdownMenuItem(value: 'Nguyễn Văn A', child: Text('Nguyễn Văn A')),
                  DropdownMenuItem(value: 'Trần Thị B', child: Text('Trần Thị B')),
                  DropdownMenuItem(value: 'Lê Văn C', child: Text('Lê Văn C')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedStudent = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedAssignment,
                decoration: const InputDecoration(labelText: 'Bài tập'),
                items: const [
                  DropdownMenuItem(value: 'Bài tập 1', child: Text('Bài tập 1')),
                  DropdownMenuItem(value: 'Bài tập 2', child: Text('Bài tập 2')),
                  DropdownMenuItem(value: 'Bài tập 3', child: Text('Bài tập 3')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedAssignment = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _scoreController,
                decoration: const InputDecoration(labelText: 'Điểm'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập điểm';
                  }
                  final score = double.tryParse(value);
                  if (score == null || score < 0 || score > 10) {
                    return 'Điểm phải từ 0 đến 10';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _commentController,
                decoration: const InputDecoration(labelText: 'Nhận xét'),
                maxLines: 3,
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
                // TODO: Implement add grade functionality
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
    final mockGrades = MockDataService.getMockGrades();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý điểm'),
      ),
      body: ListView.builder(
        itemCount: mockGrades.length,
        itemBuilder: (context, index) {
          final grade = mockGrades[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
              title: Text(grade.courseName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Học sinh: ${grade.studentName}'),
                  Text('Điểm: ${grade.score}'),
                  if (grade.comment != null) Text('Nhận xét: ${grade.comment}'),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // TODO: Implement edit grade functionality
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddGradeDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
} 
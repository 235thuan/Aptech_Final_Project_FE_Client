import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/grade/grade_bloc.dart';
import '../../../bloc/grade/grade_event.dart';
import '../../../bloc/grade/grade_state.dart';
import '../../../core/models/grade.dart';
import '../../../core/services/mock_data_service.dart';

// Màn hình quản lý điểm cho admin
class GradeManagementScreen extends StatefulWidget {
  const GradeManagementScreen({super.key});

  @override
  State<GradeManagementScreen> createState() => _GradeManagementScreenState();
}

class _GradeManagementScreenState extends State<GradeManagementScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scoreController = TextEditingController();
  final _commentController = TextEditingController();
  String _selectedStudent = '';
  String _selectedCourse = '';
  String _selectedAssignment = '';
  String _selectedSemester = '2023-2024-1';
  String _selectedAcademicYear = '2023-2024';

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                DropdownButtonFormField<String>(
                  value: _selectedAssignment,
                  decoration: const InputDecoration(labelText: 'Bài tập'),
                  items: MockDataService.getMockAssignments().map((assignment) {
                    return DropdownMenuItem(
                      value: assignment.title,
                      child: Text(assignment.title),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedAssignment = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedSemester,
                  decoration: const InputDecoration(labelText: 'Học kỳ'),
                  items: const [
                    DropdownMenuItem(value: '2023-2024-1', child: Text('Học kỳ 1 (2023-2024)')),
                    DropdownMenuItem(value: '2023-2024-2', child: Text('Học kỳ 2 (2023-2024)')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedSemester = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedAcademicYear,
                  decoration: const InputDecoration(labelText: 'Năm học'),
                  items: const [
                    DropdownMenuItem(value: '2023-2024', child: Text('2023-2024')),
                    DropdownMenuItem(value: '2024-2025', child: Text('2024-2025')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedAcademicYear = value!;
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
                    if (score == null) {
                      return 'Vui lòng nhập số hợp lệ';
                    }
                    if (score < 0 || score > 10) {
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập nhận xét';
                    }
                    return null;
                  },
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

    // Tính điểm trung bình cho từng học kỳ
    Map<String, double> semesterAverages = {};
    for (var grade in mockGrades) {
      final key = '${grade.academicYear}-${grade.semester}';
      if (!semesterAverages.containsKey(key)) {
        semesterAverages[key] = 0;
      }
      semesterAverages[key] = (semesterAverages[key]! + grade.score) / 2;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý điểm'),
      ),
      body: Column(
        children: [
          // Tổng quan điểm số
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Điểm trung bình theo học kỳ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: semesterAverages.entries.map((entry) {
                      return Card(
                        margin: const EdgeInsets.only(right: 16.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${entry.key.split('-')[2]}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                entry.value.toStringAsFixed(1),
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: entry.value >= 5 ? Colors.green : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          // Danh sách điểm
          Expanded(
            child: ListView.builder(
              itemCount: mockGrades.length,
              itemBuilder: (context, index) {
                final grade = mockGrades[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: ExpansionTile(
                    title: Text(grade.studentName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Khóa học: ${grade.courseName}'),
                        Text('Bài tập: ${grade.assignmentTitle}'),
                      ],
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Học kỳ: ${grade.semester}'),
                            Text('Năm học: ${grade.academicYear}'),
                            Text('Điểm: ${grade.score}'),
                            if (grade.comment != null) ...[
                              const SizedBox(height: 8),
                              Text('Nhận xét: ${grade.comment}'),
                            ],
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    // TODO: Implement edit grade functionality
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    // TODO: Implement delete grade functionality
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
        onPressed: _showAddGradeDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
} 
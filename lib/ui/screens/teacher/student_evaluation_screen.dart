import 'package:flutter/material.dart';
// import '../../../bloc/evaluation/evaluation_bloc.dart';
// import '../../../bloc/evaluation/evaluation_event.dart';
// import '../../../bloc/evaluation/evaluation_state.dart';
// import '../../../core/models/evaluation.dart';
import '../../../core/services/mock_data_service.dart';

// Màn hình đánh giá học sinh cho giáo viên
class StudentEvaluationScreen extends StatefulWidget {
  const StudentEvaluationScreen({super.key});

  @override
  State<StudentEvaluationScreen> createState() => _StudentEvaluationScreenState();
}

class _StudentEvaluationScreenState extends State<StudentEvaluationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _commentController = TextEditingController();
  String _selectedClass = '';
  String _selectedStudent = '';
  double _selectedAttendance = 0.0;
  double _selectedParticipation = 0.0;
  double _selectedHomework = 0.0;
  double _selectedQuiz = 0.0;
  double _selectedExam = 0.0;

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
    _commentController.dispose();
    super.dispose();
  }

  void _showAddEvaluationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm đánh giá'),
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                Text('Điểm chuyên cần: ${_selectedAttendance.toStringAsFixed(1)}'),
                Slider(
                  value: _selectedAttendance,
                  min: 0,
                  max: 10,
                  divisions: 20,
                  label: _selectedAttendance.toStringAsFixed(1),
                  onChanged: (value) {
                    setState(() {
                      _selectedAttendance = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                Text('Điểm tham gia: ${_selectedParticipation.toStringAsFixed(1)}'),
                Slider(
                  value: _selectedParticipation,
                  min: 0,
                  max: 10,
                  divisions: 20,
                  label: _selectedParticipation.toStringAsFixed(1),
                  onChanged: (value) {
                    setState(() {
                      _selectedParticipation = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                Text('Điểm bài tập: ${_selectedHomework.toStringAsFixed(1)}'),
                Slider(
                  value: _selectedHomework,
                  min: 0,
                  max: 10,
                  divisions: 20,
                  label: _selectedHomework.toStringAsFixed(1),
                  onChanged: (value) {
                    setState(() {
                      _selectedHomework = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                Text('Điểm kiểm tra: ${_selectedQuiz.toStringAsFixed(1)}'),
                Slider(
                  value: _selectedQuiz,
                  min: 0,
                  max: 10,
                  divisions: 20,
                  label: _selectedQuiz.toStringAsFixed(1),
                  onChanged: (value) {
                    setState(() {
                      _selectedQuiz = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                Text('Điểm thi: ${_selectedExam.toStringAsFixed(1)}'),
                Slider(
                  value: _selectedExam,
                  min: 0,
                  max: 10,
                  divisions: 20,
                  label: _selectedExam.toStringAsFixed(1),
                  onChanged: (value) {
                    setState(() {
                      _selectedExam = value;
                    });
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
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // TODO: Implement add evaluation functionality
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
    final mockEvaluations = MockDataService.getMockEvaluations();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Đánh giá học sinh'),
      ),
      body: ListView.builder(
        itemCount: mockEvaluations.length,
        itemBuilder: (context, index) {
          final evaluation = mockEvaluations[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ExpansionTile(
              title: Text(evaluation.studentName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Lớp: ${evaluation.className}'),
                  Text('Thời gian: ${evaluation.date.day}/${evaluation.date.month}/${evaluation.date.year}'),
                ],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Điểm chuyên cần: ${evaluation.attendance}'),
                      Text('Điểm tham gia: ${evaluation.participation}'),
                      Text('Điểm bài tập: ${evaluation.homework}'),
                      Text('Điểm kiểm tra: ${evaluation.quiz}'),
                      Text('Điểm thi: ${evaluation.exam}'),
                      Text('Tổng điểm: ${evaluation.totalScore}'),
                      if (evaluation.comment != null) ...[
                        const SizedBox(height: 8),
                        Text('Nhận xét: ${evaluation.comment}'),
                      ],
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // TODO: Implement edit evaluation functionality
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // TODO: Implement delete evaluation functionality
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
        onPressed: _showAddEvaluationDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
} 
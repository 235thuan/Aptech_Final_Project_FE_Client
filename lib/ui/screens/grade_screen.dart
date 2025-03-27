import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/grade/grade_bloc.dart';
import '../../bloc/grade/grade_event.dart';
import '../../bloc/grade/grade_state.dart';
import '../../core/models/grade.dart';
import '../../core/services/mock_data_service.dart';

// Màn hình hiển thị điểm số
class GradeScreen extends StatefulWidget {
  const GradeScreen({super.key});

  @override
  State<GradeScreen> createState() => _GradeScreenState();
}

class _GradeScreenState extends State<GradeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedSemester = '2024-1'; // Mặc định là học kỳ 1 năm 2024
  String _selectedAcademicYear = '2024-2025'; // Mặc định là năm học 2024-2025

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadGrades();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _loadGrades() {
    // Sử dụng mock data thay vì gọi API
    final mockGrades = MockDataService.getMockGrades();
    context.read<GradeBloc>().add(GradesLoadedEvent(mockGrades));
    context.read<GradeBloc>().add(CumulativeGPACalculatedEvent(8.8));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Điểm số'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Tất cả'),
            Tab(text: 'Theo học kỳ'),
            Tab(text: 'Theo năm học'),
          ],
        ),
      ),
      body: BlocListener<GradeBloc, GradeState>(
        listener: (context, state) {
          if (state is GradeError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: TabBarView(
          controller: _tabController,
          children: [
            // Tab hiển thị tất cả điểm số
            BlocBuilder<GradeBloc, GradeState>(
              builder: (context, state) {
                if (state is GradeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GradesLoaded) {
                  return Column(
                    children: [
                      _buildCumulativeGPA(),
                      Expanded(child: _buildGradesList(state.grades)),
                    ],
                  );
                }
                return const Center(child: Text('Không có điểm số'));
              },
            ),
            // Tab hiển thị điểm số theo học kỳ
            BlocBuilder<GradeBloc, GradeState>(
              builder: (context, state) {
                if (state is GradeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GradesLoaded) {
                  return Column(
                    children: [
                      _buildSemesterPicker(),
                      _buildSemesterGPA(state.grades),
                      Expanded(child: _buildGradesList(state.grades)),
                    ],
                  );
                }
                return const Center(child: Text('Không có điểm số'));
              },
            ),
            // Tab hiển thị điểm số theo năm học
            BlocBuilder<GradeBloc, GradeState>(
              builder: (context, state) {
                if (state is GradeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GradesLoaded) {
                  return Column(
                    children: [
                      _buildAcademicYearPicker(),
                      Expanded(child: _buildGradesList(state.grades)),
                    ],
                  );
                }
                return const Center(child: Text('Không có điểm số'));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCumulativeGPA() {
    return BlocBuilder<GradeBloc, GradeState>(
      builder: (context, state) {
        if (state is CumulativeGPACalculated) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Điểm trung bình tích lũy',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.gpa.toStringAsFixed(2),
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildSemesterGPA(List<Grade> grades) {
    final semesterGrades = grades.where((g) => g.semester == _selectedSemester).toList();
    if (semesterGrades.isEmpty) return const SizedBox.shrink();

    final average = semesterGrades.map((g) => g.averageScore).reduce((a, b) => a + b) / semesterGrades.length;

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Điểm trung bình học kỳ $_selectedSemester',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              average.toStringAsFixed(2),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSemesterPicker() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: _selectedSemester,
        items: const [
          DropdownMenuItem(value: '2024-1', child: Text('Học kỳ 1 (2024)')),
          DropdownMenuItem(value: '2024-2', child: Text('Học kỳ 2 (2024)')),
        ],
        onChanged: (value) {
          if (value != null) {
            setState(() {
              _selectedSemester = value;
            });
            _loadGrades();
          }
        },
      ),
    );
  }

  Widget _buildAcademicYearPicker() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: _selectedAcademicYear,
        items: const [
          DropdownMenuItem(value: '2023-2024', child: Text('2023-2024')),
          DropdownMenuItem(value: '2024-2025', child: Text('2024-2025')),
        ],
        onChanged: (value) {
          if (value != null) {
            setState(() {
              _selectedAcademicYear = value;
            });
            _loadGrades();
          }
        },
      ),
    );
  }

  Widget _buildGradesList(List<Grade> grades) {
    return ListView.builder(
      itemCount: grades.length,
      itemBuilder: (context, index) {
        final grade = grades[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ExpansionTile(
            title: Text(grade.courseName),
            subtitle: Text('Mã môn học: ${grade.courseCode}'),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Giảng viên: ${grade.instructor}'),
                    Text('Điểm chuyên cần: ${grade.attendanceScore}'),
                    Text('Điểm giữa kỳ: ${grade.midtermScore}'),
                    Text('Điểm cuối kỳ: ${grade.finalScore}'),
                    Text('Điểm trung bình: ${grade.averageScore}'),
                    Text('Điểm chữ: ${grade.grade}'),
                    Text('Học kỳ: ${grade.semester}'),
                    Text('Năm học: ${grade.academicYear}'),
                    Text('Cập nhật lúc: ${grade.lastUpdated.toString()}'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
} 
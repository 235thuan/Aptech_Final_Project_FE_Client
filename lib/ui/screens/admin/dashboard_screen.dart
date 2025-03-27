import 'package:flutter/material.dart';
// import '../../../bloc/dashboard/dashboard_bloc.dart';
// import '../../../bloc/dashboard/dashboard_event.dart';
// import '../../../bloc/dashboard/dashboard_state.dart';
import '../../../core/services/mock_data_service.dart';

// Màn hình tổng quan cho admin
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sử dụng mock data thay vì gọi API
    final mockUsers = MockDataService.getMockUsers();
    final mockFeedbacks = MockDataService.getMockFeedbacks();
    final mockCourses = MockDataService.getMockCourses();
    final mockClasses = MockDataService.getMockClasses();

    final mockGrades = MockDataService.getMockGrades();

    // Tính toán các thống kê
    final totalStudents = mockUsers.where((user) => user.role == 'student').length;
    final totalTeachers = mockUsers.where((user) => user.role == 'teacher').length;
    final totalCourses = mockCourses.length;
    final totalClasses = mockClasses.length;
    final pendingFeedbacks = mockFeedbacks.where((f) => f.status == 'pending').length;
    final averageGrade = mockGrades.isEmpty
        ? 0.0
        : mockGrades.map((g) => g.score).reduce((a, b) => a + b) / mockGrades.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tổng quan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // TODO: Implement refresh functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thống kê tổng quan
            const Text(
              'Thống kê tổng quan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              children: [
                _buildStatCard(
                  'Tổng số học sinh',
                  totalStudents.toString(),
                  Icons.people,
                  Colors.blue,
                ),
                _buildStatCard(
                  'Tổng số giáo viên',
                  totalTeachers.toString(),
                  Icons.person,
                  Colors.green,
                ),
                _buildStatCard(
                  'Tổng số khóa học',
                  totalCourses.toString(),
                  Icons.book,
                  Colors.orange,
                ),
                _buildStatCard(
                  'Tổng số lớp học',
                  totalClasses.toString(),
                  Icons.class_,
                  Colors.purple,
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Thống kê chi tiết
            const Text(
              'Thống kê chi tiết',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailItem(
                      'Phản hồi chờ xử lý',
                      pendingFeedbacks.toString(),
                      Icons.feedback,
                      Colors.orange,
                    ),
                    const Divider(),
                    _buildDetailItem(
                      'Điểm trung bình',
                      averageGrade.toStringAsFixed(1),
                      Icons.grade,
                      Colors.blue,
                    ),
                    const Divider(),
                    _buildDetailItem(
                      'Tỷ lệ học sinh đạt',
                      '${(mockGrades.where((g) => g.score >= 5).length / mockGrades.length * 100).toStringAsFixed(1)}%',
                      Icons.trending_up,
                      Colors.green,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Hoạt động gần đây
            const Text(
              'Hoạt động gần đây',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.notifications),
                    ),
                    title: Text('Hoạt động ${index + 1}'),
                    subtitle: Text('Mô tả hoạt động ${index + 1}'),
                    trailing: Text('${DateTime.now().subtract(Duration(hours: index)).toString().substring(0, 16)}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String title, String value, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
} 
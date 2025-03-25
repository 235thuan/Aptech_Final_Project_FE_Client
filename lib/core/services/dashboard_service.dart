class DashboardService {
  // Lấy dữ liệu tổng quan cho dashboard
  Future<Map<String, dynamic>> getDashboardData() async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
      return {
        'totalStudents': 100,
        'totalTeachers': 20,
        'totalCourses': 15,
        'totalClasses': 25,
        'pendingFeedbacks': 5,
        'averageGrade': 8.5,
        'recentActivities': [
          {
            'id': '1',
            'type': 'enrollment',
            'description': 'Sinh viên mới đăng ký',
            'timestamp': DateTime.now().toIso8601String(),
          },
          {
            'id': '2',
            'type': 'grade',
            'description': 'Cập nhật điểm số',
            'timestamp': DateTime.now().toIso8601String(),
          },
        ],
      };
    } catch (e) {
      throw Exception('Failed to load dashboard data: $e');
    }
  }
} 
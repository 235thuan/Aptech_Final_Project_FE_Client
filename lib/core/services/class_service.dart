import '../models/class.dart';
import 'mock_data_service.dart';

class ClassService {
  // Lấy danh sách lớp học
  Future<List<Class>> getClasses() async {
    try {
      // TODO: Implement API call
      return MockDataService.getMockClasses();
    } catch (e) {
      throw Exception('Failed to load classes: $e');
    }
  }

  // Thêm lớp học mới
  Future<void> addClass({
    required String name,
    required String description,
    required String courseId,
    required String courseName,
    required String teacherId,
    required String teacherName,
    required String schedule,
    required String startDate,
    required String endDate,
    required int capacity,
    required int currentStudents,
    required String status,
  }) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw Exception('Failed to add class: $e');
    }
  }

  // Cập nhật lớp học
  Future<void> updateClass({
    required String id,
    required String name,
    required String description,
    required String courseId,
    required String courseName,
    required String teacherId,
    required String teacherName,
    required String schedule,
    required String startDate,
    required String endDate,
    required int capacity,
    required int currentStudents,
    required String status,
  }) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw Exception('Failed to update class: $e');
    }
  }

  // Xóa lớp học
  Future<void> deleteClass(String id) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw Exception('Failed to delete class: $e');
    }
  }
} 
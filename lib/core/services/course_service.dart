import 'package:flutter/foundation.dart';
import '../models/course.dart';

// Service xử lý các thao tác liên quan đến môn học
class CourseService {
  // Lấy danh sách môn học có thể đăng ký
  Future<List<Course>> getAvailableCourses() async {
    try {
      // TODO: Implement API call to get available courses
      // Đây là nơi sẽ gọi API lấy danh sách môn học
      throw UnimplementedError('Chưa implement API lấy danh sách môn học');
    } catch (e) {
      debugPrint('Lỗi lấy danh sách môn học: $e');
      rethrow;
    }
  }

  // Lấy thông tin chi tiết môn học
  Future<Course> getCourseDetails(String courseId) async {
    try {
      // TODO: Implement API call to get course details
      // Đây là nơi sẽ gọi API lấy thông tin chi tiết môn học
      throw UnimplementedError('Chưa implement API lấy thông tin chi tiết môn học');
    } catch (e) {
      debugPrint('Lỗi lấy thông tin chi tiết môn học: $e');
      rethrow;
    }
  }

  // Đăng ký môn học
  Future<bool> registerCourse(String studentId, String courseId) async {
    try {
      // TODO: Implement API call to register course
      // Đây là nơi sẽ gọi API đăng ký môn học
      throw UnimplementedError('Chưa implement API đăng ký môn học');
    } catch (e) {
      debugPrint('Lỗi đăng ký môn học: $e');
      rethrow;
    }
  }

  // Hủy đăng ký môn học
  Future<bool> cancelRegistration(String studentId, String courseId) async {
    try {
      // TODO: Implement API call to cancel registration
      // Đây là nơi sẽ gọi API hủy đăng ký môn học
      throw UnimplementedError('Chưa implement API hủy đăng ký môn học');
    } catch (e) {
      debugPrint('Lỗi hủy đăng ký môn học: $e');
      rethrow;
    }
  }

  // Lấy danh sách môn học đã đăng ký
  Future<List<Course>> getRegisteredCourses(String studentId) async {
    try {
      // TODO: Implement API call to get registered courses
      // Đây là nơi sẽ gọi API lấy danh sách môn học đã đăng ký
      throw UnimplementedError('Chưa implement API lấy danh sách môn học đã đăng ký');
    } catch (e) {
      debugPrint('Lỗi lấy danh sách môn học đã đăng ký: $e');
      rethrow;
    }
  }

  // Kiểm tra điều kiện tiên quyết
  Future<bool> checkPrerequisites(String studentId, String courseId) async {
    try {
      // TODO: Implement API call to check prerequisites
      // Đây là nơi sẽ gọi API kiểm tra điều kiện tiên quyết
      throw UnimplementedError('Chưa implement API kiểm tra điều kiện tiên quyết');
    } catch (e) {
      debugPrint('Lỗi kiểm tra điều kiện tiên quyết: $e');
      rethrow;
    }
  }
}
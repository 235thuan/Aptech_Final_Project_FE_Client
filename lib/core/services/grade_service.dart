import 'package:flutter/foundation.dart';
import '../models/grade.dart';

// Service xử lý các thao tác liên quan đến điểm số
class GradeService {
  // Lấy điểm số của sinh viên
  Future<List<Grade>> getStudentGrades(String studentId) async {
    try {
      // TODO: Implement API call to get student grades
      // Đây là nơi sẽ gọi API lấy điểm số của sinh viên
      throw UnimplementedError('Chưa implement API lấy điểm số');
    } catch (e) {
      debugPrint('Lỗi lấy điểm số: $e');
      rethrow;
    }
  }

  // Lấy điểm số theo học kỳ
  Future<List<Grade>> getGradesBySemester(String studentId, String semester) async {
    try {
      // TODO: Implement API call to get grades by semester
      // Đây là nơi sẽ gọi API lấy điểm số theo học kỳ
      throw UnimplementedError('Chưa implement API lấy điểm số theo học kỳ');
    } catch (e) {
      debugPrint('Lỗi lấy điểm số theo học kỳ: $e');
      rethrow;
    }
  }

  // Lấy điểm số theo năm học
  Future<List<Grade>> getGradesByAcademicYear(String studentId, String academicYear) async {
    try {
      // TODO: Implement API call to get grades by academic year
      // Đây là nơi sẽ gọi API lấy điểm số theo năm học
      throw UnimplementedError('Chưa implement API lấy điểm số theo năm học');
    } catch (e) {
      debugPrint('Lỗi lấy điểm số theo năm học: $e');
      rethrow;
    }
  }

  // Lấy điểm số của một môn học cụ thể
  Future<Grade?> getCourseGrade(String studentId, String courseId) async {
    try {
      // TODO: Implement API call to get course grade
      // Đây là nơi sẽ gọi API lấy điểm số của một môn học
      throw UnimplementedError('Chưa implement API lấy điểm số môn học');
    } catch (e) {
      debugPrint('Lỗi lấy điểm số môn học: $e');
      rethrow;
    }
  }

  // Tính điểm trung bình học kỳ
  Future<double> calculateSemesterGPA(String studentId, String semester) async {
    try {
      // TODO: Implement API call to calculate semester GPA
      // Đây là nơi sẽ gọi API tính điểm trung bình học kỳ
      throw UnimplementedError('Chưa implement API tính điểm trung bình học kỳ');
    } catch (e) {
      debugPrint('Lỗi tính điểm trung bình học kỳ: $e');
      rethrow;
    }
  }

  // Tính điểm trung bình tích lũy
  Future<double> calculateCumulativeGPA(String studentId) async {
    try {
      // TODO: Implement API call to calculate cumulative GPA
      // Đây là nơi sẽ gọi API tính điểm trung bình tích lũy
      throw UnimplementedError('Chưa implement API tính điểm trung bình tích lũy');
    } catch (e) {
      debugPrint('Lỗi tính điểm trung bình tích lũy: $e');
      rethrow;
    }
  }
}
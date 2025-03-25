import 'package:flutter/foundation.dart';
import '../models/grade.dart';
import 'mock_data_service.dart';

// Service xử lý các thao tác liên quan đến điểm số
class GradeService {
  // Lấy danh sách điểm số
  Future<List<Grade>> getGrades() async {
    try {
      // TODO: Implement API call
      return MockDataService.getMockGrades();
    } catch (e) {
      debugPrint('Lỗi lấy danh sách điểm số: $e');
      rethrow;
    }
  }

  // Thêm điểm số mới
  Future<void> addGrade({
    required String studentId,
    required String studentName,
    required String courseId,
    required String courseName,
    required String assignmentId,
    required String assignmentName,
    required double score,
    required String semester,
    required String academicYear,
    required String comment,
  }) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      debugPrint('Lỗi thêm điểm số: $e');
      rethrow;
    }
  }

  // Cập nhật điểm số
  Future<void> updateGrade({
    required String id,
    required String studentId,
    required String studentName,
    required String courseId,
    required String courseName,
    required String assignmentId,
    required String assignmentName,
    required double score,
    required String semester,
    required String academicYear,
    required String comment,
  }) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      debugPrint('Lỗi cập nhật điểm số: $e');
      rethrow;
    }
  }

  // Xóa điểm số
  Future<void> deleteGrade(String id) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      debugPrint('Lỗi xóa điểm số: $e');
      rethrow;
    }
  }

  // Lấy điểm số của sinh viên
  Future<List<Grade>> getStudentGrades(String studentId) async {
    try {
      // TODO: Implement API call to get student grades
      return MockDataService.getMockGrades().where((grade) => grade.studentId == studentId).toList();
    } catch (e) {
      debugPrint('Lỗi lấy điểm số: $e');
      rethrow;
    }
  }

  // Lấy điểm số theo học kỳ
  Future<List<Grade>> getGradesBySemester(String studentId, String semester) async {
    try {
      // TODO: Implement API call to get grades by semester
      return MockDataService.getMockGrades()
          .where((grade) => grade.studentId == studentId && grade.semester == semester)
          .toList();
    } catch (e) {
      debugPrint('Lỗi lấy điểm số theo học kỳ: $e');
      rethrow;
    }
  }

  // Lấy điểm số theo năm học
  Future<List<Grade>> getGradesByAcademicYear(String studentId, String academicYear) async {
    try {
      // TODO: Implement API call to get grades by academic year
      return MockDataService.getMockGrades()
          .where((grade) => grade.studentId == studentId && grade.academicYear == academicYear)
          .toList();
    } catch (e) {
      debugPrint('Lỗi lấy điểm số theo năm học: $e');
      rethrow;
    }
  }

  // Lấy điểm số của một môn học cụ thể
  Future<Grade?> getCourseGrade(String studentId, String courseId) async {
    try {
      // TODO: Implement API call to get course grade
      return MockDataService.getMockGrades()
          .firstWhere((grade) => grade.studentId == studentId && grade.courseId == courseId);
    } catch (e) {
      debugPrint('Lỗi lấy điểm số môn học: $e');
      rethrow;
    }
  }

  // Tính điểm trung bình học kỳ
  Future<double> calculateSemesterGPA(String studentId, String semester) async {
    try {
      // TODO: Implement API call to calculate semester GPA
      final grades = await getGradesBySemester(studentId, semester);
      if (grades.isEmpty) return 0.0;
      final total = grades.fold(0.0, (sum, grade) => sum + grade.score);
      return total / grades.length;
    } catch (e) {
      debugPrint('Lỗi tính điểm trung bình học kỳ: $e');
      rethrow;
    }
  }

  // Tính điểm trung bình tích lũy
  Future<double> calculateCumulativeGPA(String studentId) async {
    try {
      // TODO: Implement API call to calculate cumulative GPA
      final grades = await getStudentGrades(studentId);
      if (grades.isEmpty) return 0.0;
      final total = grades.fold(0.0, (sum, grade) => sum + grade.score);
      return total / grades.length;
    } catch (e) {
      debugPrint('Lỗi tính điểm trung bình tích lũy: $e');
      rethrow;
    }
  }
}
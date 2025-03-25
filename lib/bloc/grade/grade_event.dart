import '../../core/models/grade.dart';

// Các sự kiện liên quan đến điểm số
abstract class GradeEvent {}

// Sự kiện lấy điểm số của sinh viên
class GetStudentGradesEvent extends GradeEvent {
  final String studentId;

  GetStudentGradesEvent(this.studentId);
}

// Sự kiện lấy điểm số theo học kỳ
class GetGradesBySemesterEvent extends GradeEvent {
  final String studentId;
  final String semester;

  GetGradesBySemesterEvent({
    required this.studentId,
    required this.semester,
  });
}

// Sự kiện lấy điểm số theo năm học
class GetGradesByAcademicYearEvent extends GradeEvent {
  final String studentId;
  final String academicYear;

  GetGradesByAcademicYearEvent({
    required this.studentId,
    required this.academicYear,
  });
}

// Sự kiện lấy điểm số của một môn học
class GetCourseGradeEvent extends GradeEvent {
  final String studentId;
  final String courseId;

  GetCourseGradeEvent({
    required this.studentId,
    required this.courseId,
  });
}

// Sự kiện tính điểm trung bình học kỳ
class CalculateSemesterGPAEvent extends GradeEvent {
  final String studentId;
  final String semester;

  CalculateSemesterGPAEvent({
    required this.studentId,
    required this.semester,
  });
}

// Sự kiện tính điểm trung bình tích lũy
class CalculateCumulativeGPAEvent extends GradeEvent {
  final String studentId;

  CalculateCumulativeGPAEvent(this.studentId);
}

// Sự kiện khi tải danh sách điểm số
class GradesLoadedEvent extends GradeEvent {
  final List<Grade> grades;
  GradesLoadedEvent(this.grades);
}

// Sự kiện khi tính toán điểm trung bình tích lũy
class CumulativeGPACalculatedEvent extends GradeEvent {
  final double gpa;
  CumulativeGPACalculatedEvent(this.gpa);
}

// Sự kiện khi tải điểm số theo học kỳ
class SemesterGradesLoadedEvent extends GradeEvent {
  final String semester;
  final List<Grade> grades;
  SemesterGradesLoadedEvent(this.semester, this.grades);
}

// Sự kiện khi tải điểm số theo năm học
class AcademicYearGradesLoadedEvent extends GradeEvent {
  final String academicYear;
  final List<Grade> grades;
  AcademicYearGradesLoadedEvent(this.academicYear, this.grades);
} 
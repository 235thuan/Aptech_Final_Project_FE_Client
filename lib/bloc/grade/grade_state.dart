import '../../core/models/grade.dart';

// Các trạng thái liên quan đến điểm số
abstract class GradeState {}

// Trạng thái khởi tạo
class GradeInitial extends GradeState {}

// Trạng thái đang xử lý
class GradeLoading extends GradeState {}

// Trạng thái lấy điểm số thành công
class GradesLoaded extends GradeState {
  final List<Grade> grades;

  GradesLoaded(this.grades);
}

// Trạng thái lấy điểm số theo học kỳ thành công
class GradesBySemesterLoaded extends GradeState {
  final List<Grade> grades;
  final String semester;

  GradesBySemesterLoaded({
    required this.grades,
    required this.semester,
  });
}

// Trạng thái lấy điểm số theo năm học thành công
class GradesByAcademicYearLoaded extends GradeState {
  final List<Grade> grades;
  final String academicYear;

  GradesByAcademicYearLoaded({
    required this.grades,
    required this.academicYear,
  });
}

// Trạng thái lấy điểm số môn học thành công
class CourseGradeLoaded extends GradeState {
  final Grade grade;

  CourseGradeLoaded(this.grade);
}

// Trạng thái tính điểm trung bình học kỳ thành công
class SemesterGPACalculated extends GradeState {
  final double gpa;
  final String semester;

  SemesterGPACalculated({
    required this.gpa,
    required this.semester,
  });
}

// Trạng thái tính điểm trung bình tích lũy thành công
class CumulativeGPACalculated extends GradeState {
  final double gpa;

  CumulativeGPACalculated(this.gpa);
}

// Trạng thái lỗi
class GradeError extends GradeState {
  final String message;

  GradeError(this.message);
}
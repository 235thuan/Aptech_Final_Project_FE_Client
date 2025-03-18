import '../../core/models/course.dart';

// Các trạng thái liên quan đến môn học
abstract class CourseState {}

// Trạng thái khởi tạo
class CourseInitial extends CourseState {}

// Trạng thái đang xử lý
class CourseLoading extends CourseState {}

// Trạng thái lấy danh sách môn học thành công
class AvailableCoursesLoaded extends CourseState {
  final List<Course> courses;

  AvailableCoursesLoaded(this.courses);
}

// Trạng thái lấy thông tin chi tiết môn học thành công
class CourseDetailsLoaded extends CourseState {
  final Course course;

  CourseDetailsLoaded(this.course);
}

// Trạng thái đăng ký môn học thành công
class CourseRegistered extends CourseState {
  final Course course;

  CourseRegistered(this.course);
}

// Trạng thái hủy đăng ký môn học thành công
class RegistrationCancelled extends CourseState {
  final String courseId;

  RegistrationCancelled(this.courseId);
}

// Trạng thái lấy danh sách môn học đã đăng ký thành công
class RegisteredCoursesLoaded extends CourseState {
  final List<Course> courses;

  RegisteredCoursesLoaded(this.courses);
}

// Trạng thái kiểm tra điều kiện tiên quyết thành công
class PrerequisitesChecked extends CourseState {
  final bool passed;
  final List<String> missingPrerequisites;

  PrerequisitesChecked({
    required this.passed,
    this.missingPrerequisites = const [],
  });
}

// Trạng thái lỗi
class CourseError extends CourseState {
  final String message;

  CourseError(this.message);
}
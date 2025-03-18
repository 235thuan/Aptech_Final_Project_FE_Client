// Các sự kiện liên quan đến môn học
abstract class CourseEvent {}

// Sự kiện lấy danh sách môn học có thể đăng ký
class GetAvailableCoursesEvent extends CourseEvent {}

// Sự kiện lấy thông tin chi tiết môn học
class GetCourseDetailsEvent extends CourseEvent {
  final String courseId;

  GetCourseDetailsEvent(this.courseId);
}

// Sự kiện đăng ký môn học
class RegisterCourseEvent extends CourseEvent {
  final String studentId;
  final String courseId;

  RegisterCourseEvent({
    required this.studentId,
    required this.courseId,
  });
}

// Sự kiện hủy đăng ký môn học
class CancelRegistrationEvent extends CourseEvent {
  final String studentId;
  final String courseId;

  CancelRegistrationEvent({
    required this.studentId,
    required this.courseId,
  });
}

// Sự kiện lấy danh sách môn học đã đăng ký
class GetRegisteredCoursesEvent extends CourseEvent {
  final String studentId;

  GetRegisteredCoursesEvent(this.studentId);
}

// Sự kiện kiểm tra điều kiện tiên quyết
class CheckPrerequisitesEvent extends CourseEvent {
  final String studentId;
  final String courseId;

  CheckPrerequisitesEvent({
    required this.studentId,
    required this.courseId,
  });
} 
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/course_service.dart';
import 'course_event.dart';
import 'course_state.dart';

// BLoC xử lý logic liên quan đến môn học
class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseService _courseService;

  CourseBloc(this._courseService) : super(CourseInitial()) {
    // Xử lý sự kiện lấy danh sách môn học có thể đăng ký
    on<GetAvailableCoursesEvent>((event, emit) async {
      try {
        emit(CourseLoading());
        final courses = await _courseService.getAvailableCourses();
        emit(AvailableCoursesLoaded(courses));
      } catch (e) {
        emit(CourseError(e.toString()));
      }
    });

    // Xử lý sự kiện lấy thông tin chi tiết môn học
    on<GetCourseDetailsEvent>((event, emit) async {
      try {
        emit(CourseLoading());
        final course = await _courseService.getCourseDetails(event.courseId);
        emit(CourseDetailsLoaded(course));
      } catch (e) {
        emit(CourseError(e.toString()));
      }
    });

    // Xử lý sự kiện đăng ký môn học
    on<RegisterCourseEvent>((event, emit) async {
      try {
        emit(CourseLoading());
        // Kiểm tra điều kiện tiên quyết trước khi đăng ký
        final prerequisitesPassed = await _courseService.checkPrerequisites(
          event.studentId,
          event.courseId,
        );

        if (!prerequisitesPassed) {
          emit(CourseError('Chưa đủ điều kiện tiên quyết để đăng ký môn học này'));
          return;
        }

        final success = await _courseService.registerCourse(
          event.studentId,
          event.courseId,
        );

        if (success) {
          final course = await _courseService.getCourseDetails(event.courseId);
          emit(CourseRegistered(course));
        } else {
          emit(CourseError('Đăng ký môn học thất bại'));
        }
      } catch (e) {
        emit(CourseError(e.toString()));
      }
    });

    // Xử lý sự kiện hủy đăng ký môn học
    on<CancelRegistrationEvent>((event, emit) async {
      try {
        emit(CourseLoading());
        final success = await _courseService.cancelRegistration(
          event.studentId,
          event.courseId,
        );

        if (success) {
          emit(RegistrationCancelled(event.courseId));
        } else {
          emit(CourseError('Hủy đăng ký môn học thất bại'));
        }
      } catch (e) {
        emit(CourseError(e.toString()));
      }
    });

    // Xử lý sự kiện lấy danh sách môn học đã đăng ký
    on<GetRegisteredCoursesEvent>((event, emit) async {
      try {
        emit(CourseLoading());
        final courses = await _courseService.getRegisteredCourses(event.studentId);
        emit(RegisteredCoursesLoaded(courses));
      } catch (e) {
        emit(CourseError(e.toString()));
      }
    });

    // Xử lý sự kiện kiểm tra điều kiện tiên quyết
    on<CheckPrerequisitesEvent>((event, emit) async {
      try {
        emit(CourseLoading());
        final passed = await _courseService.checkPrerequisites(
          event.studentId,
          event.courseId,
        );
        emit(PrerequisitesChecked(passed: passed));
      } catch (e) {
        emit(CourseError(e.toString()));
      }
    });
  }
}
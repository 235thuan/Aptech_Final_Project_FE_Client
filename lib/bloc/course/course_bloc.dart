import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/mock_data_service.dart';
import 'course_event.dart';
import 'course_state.dart';

// BLoC xử lý logic liên quan đến môn học
class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    on<GetAvailableCoursesEvent>(_onGetAvailableCourses);
    on<GetRegisteredCoursesEvent>(_onGetRegisteredCourses);
    on<RegisterCourseEvent>(_onRegisterCourse);
    on<CancelRegistrationEvent>(_onCancelRegistration);
  }

  Future<void> _onGetAvailableCourses(
    GetAvailableCoursesEvent event,
    Emitter<CourseState> emit,
  ) async {
    try {
      emit(CourseLoading());
      final courses = MockDataService.getMockCourses();
      emit(AvailableCoursesLoaded(courses));
    } catch (e) {
      emit(CourseError(e.toString()));
    }
  }

  Future<void> _onGetRegisteredCourses(
    GetRegisteredCoursesEvent event,
    Emitter<CourseState> emit,
  ) async {
    try {
      emit(CourseLoading());
      final courses = MockDataService.getMockCourses().take(2).toList(); // Mock registered courses
      emit(RegisteredCoursesLoaded(courses));
    } catch (e) {
      emit(CourseError(e.toString()));
    }
  }

  Future<void> _onRegisterCourse(
    RegisterCourseEvent event,
    Emitter<CourseState> emit,
  ) async {
    try {
      emit(CourseLoading());
      // TODO: Implement actual registration logic
      final course = MockDataService.getMockCourses().first; // Mock registered course
      emit(CourseRegistered(course));
    } catch (e) {
      emit(CourseError(e.toString()));
    }
  }

  Future<void> _onCancelRegistration(
    CancelRegistrationEvent event,
    Emitter<CourseState> emit,
  ) async {
    try {
      emit(CourseLoading());
      // TODO: Implement actual cancellation logic
      emit(RegistrationCancelled(event.courseId));
    } catch (e) {
      emit(CourseError(e.toString()));
    }
  }
}
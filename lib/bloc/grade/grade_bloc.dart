import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/grade_service.dart';
import 'grade_event.dart';
import 'grade_state.dart';

// BLoC xử lý logic liên quan đến điểm số
class GradeBloc extends Bloc<GradeEvent, GradeState> {
  final GradeService _gradeService;

  GradeBloc(this._gradeService) : super(GradeInitial()) {
    // Xử lý sự kiện lấy điểm số của sinh viên
    on<GetStudentGradesEvent>((event, emit) async {
      try {
        emit(GradeLoading());
        final grades = await _gradeService.getStudentGrades(event.studentId);
        emit(GradesLoaded(grades));
      } catch (e) {
        emit(GradeError(e.toString()));
      }
    });

    // Xử lý sự kiện lấy điểm số theo học kỳ
    on<GetGradesBySemesterEvent>((event, emit) async {
      try {
        emit(GradeLoading());
        final grades = await _gradeService.getGradesBySemester(
          event.studentId,
          event.semester,
        );
        emit(GradesBySemesterLoaded(
          grades: grades,
          semester: event.semester,
        ));
      } catch (e) {
        emit(GradeError(e.toString()));
      }
    });

    // Xử lý sự kiện lấy điểm số theo năm học
    on<GetGradesByAcademicYearEvent>((event, emit) async {
      try {
        emit(GradeLoading());
        final grades = await _gradeService.getGradesByAcademicYear(
          event.studentId,
          event.academicYear,
        );
        emit(GradesByAcademicYearLoaded(
          grades: grades,
          academicYear: event.academicYear,
        ));
      } catch (e) {
        emit(GradeError(e.toString()));
      }
    });

    // Xử lý sự kiện lấy điểm số của một môn học
    on<GetCourseGradeEvent>((event, emit) async {
      try {
        emit(GradeLoading());
        final grade = await _gradeService.getCourseGrade(
          event.studentId,
          event.courseId,
        );
        if (grade != null) {
          emit(CourseGradeLoaded(grade));
        } else {
          emit(GradeError('Không tìm thấy điểm số môn học'));
        }
      } catch (e) {
        emit(GradeError(e.toString()));
      }
    });

    // Xử lý sự kiện tính điểm trung bình học kỳ
    on<CalculateSemesterGPAEvent>((event, emit) async {
      try {
        emit(GradeLoading());
        final gpa = await _gradeService.calculateSemesterGPA(
          event.studentId,
          event.semester,
        );
        emit(SemesterGPACalculated(
          gpa: gpa,
          semester: event.semester,
        ));
      } catch (e) {
        emit(GradeError(e.toString()));
      }
    });

    // Xử lý sự kiện tính điểm trung bình tích lũy
    on<CalculateCumulativeGPAEvent>((event, emit) async {
      try {
        emit(GradeLoading());
        final gpa = await _gradeService.calculateCumulativeGPA(event.studentId);
        emit(CumulativeGPACalculated(gpa));
      } catch (e) {
        emit(GradeError(e.toString()));
      }
    });
  }
} 
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/mock_data_service.dart';
import 'grade_event.dart';
import 'grade_state.dart';

// BLoC xử lý logic liên quan đến điểm số
class GradeBloc extends Bloc<GradeEvent, GradeState> {
  GradeBloc() : super(GradeInitial()) {
    on<GradesLoadedEvent>(_onGradesLoaded);
    on<SemesterGradesLoadedEvent>(_onSemesterGradesLoaded);
    on<AcademicYearGradesLoadedEvent>(_onAcademicYearGradesLoaded);
    on<CumulativeGPACalculatedEvent>(_onCumulativeGPACalculated);
  }

  Future<void> _onGradesLoaded(
    GradesLoadedEvent event,
    Emitter<GradeState> emit,
  ) async {
    try {
      emit(GradeLoading());
      final grades = MockDataService.getMockGrades();
      emit(GradesLoaded(grades));
    } catch (e) {
      emit(GradeError(e.toString()));
    }
  }

  Future<void> _onSemesterGradesLoaded(
    SemesterGradesLoadedEvent event,
    Emitter<GradeState> emit,
  ) async {
    try {
      emit(GradeLoading());
      final grades = MockDataService.getMockGrades();
      emit(GradesBySemesterLoaded(
        grades: grades,
        semester: event.semester,
      ));
    } catch (e) {
      emit(GradeError(e.toString()));
    }
  }

  Future<void> _onAcademicYearGradesLoaded(
    AcademicYearGradesLoadedEvent event,
    Emitter<GradeState> emit,
  ) async {
    try {
      emit(GradeLoading());
      final grades = MockDataService.getMockGrades();
      emit(GradesByAcademicYearLoaded(
        grades: grades,
        academicYear: event.academicYear,
      ));
    } catch (e) {
      emit(GradeError(e.toString()));
    }
  }

  Future<void> _onCumulativeGPACalculated(
    CumulativeGPACalculatedEvent event,
    Emitter<GradeState> emit,
  ) async {
    try {
      emit(CumulativeGPACalculated(event.gpa));
    } catch (e) {
      emit(GradeError(e.toString()));
    }
  }
} 
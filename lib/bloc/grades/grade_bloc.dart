import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../core/models/grade.dart';
import '../../core/services/grade_service.dart';

// Events
abstract class GradeEvent extends Equatable {
  const GradeEvent();

  @override
  List<Object?> get props => [];
}

class LoadGrades extends GradeEvent {}

class AddGrade extends GradeEvent {
  final String studentId;
  final String studentName;
  final String courseId;
  final String courseName;
  final String assignmentId;
  final String assignmentName;
  final double score;
  final String semester;
  final String academicYear;
  final String comment;

  const AddGrade({
    required this.studentId,
    required this.studentName,
    required this.courseId,
    required this.courseName,
    required this.assignmentId,
    required this.assignmentName,
    required this.score,
    required this.semester,
    required this.academicYear,
    required this.comment,
  });

  @override
  List<Object?> get props => [studentId, studentName, courseId, courseName, assignmentId, assignmentName, score, semester, academicYear, comment];
}

class UpdateGrade extends GradeEvent {
  final String id;
  final String studentId;
  final String studentName;
  final String courseId;
  final String courseName;
  final String assignmentId;
  final String assignmentName;
  final double score;
  final String semester;
  final String academicYear;
  final String comment;

  const UpdateGrade({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.courseId,
    required this.courseName,
    required this.assignmentId,
    required this.assignmentName,
    required this.score,
    required this.semester,
    required this.academicYear,
    required this.comment,
  });

  @override
  List<Object?> get props => [id, studentId, studentName, courseId, courseName, assignmentId, assignmentName, score, semester, academicYear, comment];
}

class DeleteGrade extends GradeEvent {
  final String id;

  const DeleteGrade(this.id);

  @override
  List<Object?> get props => [id];
}

// States
abstract class GradeState extends Equatable {
  const GradeState();

  @override
  List<Object?> get props => [];
}

class GradeInitial extends GradeState {}

class GradeLoading extends GradeState {}

class GradeLoaded extends GradeState {
  final List<Grade> grades;

  const GradeLoaded(this.grades);

  @override
  List<Object?> get props => [grades];
}

class GradeError extends GradeState {
  final String message;

  const GradeError(this.message);

  @override
  List<Object?> get props => [message];
}

// BLoC
class GradeBloc extends Bloc<GradeEvent, GradeState> {
  final GradeService _gradeService;

  GradeBloc(this._gradeService) : super(GradeInitial()) {
    on<LoadGrades>(_onLoadGrades);
    on<AddGrade>(_onAddGrade);
    on<UpdateGrade>(_onUpdateGrade);
    on<DeleteGrade>(_onDeleteGrade);
  }

  Future<void> _onLoadGrades(
    LoadGrades event,
    Emitter<GradeState> emit,
  ) async {
    try {
      emit(GradeLoading());
      final grades = await _gradeService.getGrades();
      emit(GradeLoaded(grades));
    } catch (e) {
      emit(GradeError(e.toString()));
    }
  }

  Future<void> _onAddGrade(
    AddGrade event,
    Emitter<GradeState> emit,
  ) async {
    try {
      emit(GradeLoading());
      await _gradeService.addGrade(
        studentId: event.studentId,
        studentName: event.studentName,
        courseId: event.courseId,
        courseName: event.courseName,
        assignmentId: event.assignmentId,
        assignmentName: event.assignmentName,
        score: event.score,
        semester: event.semester,
        academicYear: event.academicYear,
        comment: event.comment,
      );
      final grades = await _gradeService.getGrades();
      emit(GradeLoaded(grades));
    } catch (e) {
      emit(GradeError(e.toString()));
    }
  }

  Future<void> _onUpdateGrade(
    UpdateGrade event,
    Emitter<GradeState> emit,
  ) async {
    try {
      emit(GradeLoading());
      await _gradeService.updateGrade(
        id: event.id,
        studentId: event.studentId,
        studentName: event.studentName,
        courseId: event.courseId,
        courseName: event.courseName,
        assignmentId: event.assignmentId,
        assignmentName: event.assignmentName,
        score: event.score,
        semester: event.semester,
        academicYear: event.academicYear,
        comment: event.comment,
      );
      final grades = await _gradeService.getGrades();
      emit(GradeLoaded(grades));
    } catch (e) {
      emit(GradeError(e.toString()));
    }
  }

  Future<void> _onDeleteGrade(
    DeleteGrade event,
    Emitter<GradeState> emit,
  ) async {
    try {
      emit(GradeLoading());
      await _gradeService.deleteGrade(event.id);
      final grades = await _gradeService.getGrades();
      emit(GradeLoaded(grades));
    } catch (e) {
      emit(GradeError(e.toString()));
    }
  }
} 
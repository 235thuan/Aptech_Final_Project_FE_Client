import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/mock_data_service.dart';
import 'assignment_event.dart';
import 'assignment_state.dart';

// BLoC xử lý logic liên quan đến bài tập
class AssignmentBloc extends Bloc<AssignmentEvent, AssignmentState> {
  AssignmentBloc() : super(AssignmentInitial()) {
    on<AssignmentsLoadedEvent>(_onAssignmentsLoaded);
    on<AddAssignmentEvent>(_onAddAssignment);
    on<UpdateAssignmentEvent>(_onUpdateAssignment);
    on<DeleteAssignmentEvent>(_onDeleteAssignment);
  }

  Future<void> _onAssignmentsLoaded(
    AssignmentsLoadedEvent event,
    Emitter<AssignmentState> emit,
  ) async {
    try {
      emit(AssignmentLoading());
      emit(AssignmentsLoaded(event.assignments));
    } catch (e) {
      emit(AssignmentError(e.toString()));
    }
  }

  Future<void> _onAddAssignment(
    AddAssignmentEvent event,
    Emitter<AssignmentState> emit,
  ) async {
    try {
      emit(AssignmentLoading());
      // TODO: Implement actual add assignment logic
      final assignments = MockDataService.getMockAssignments();
      emit(AssignmentsLoaded(assignments));
    } catch (e) {
      emit(AssignmentError(e.toString()));
    }
  }

  Future<void> _onUpdateAssignment(
    UpdateAssignmentEvent event,
    Emitter<AssignmentState> emit,
  ) async {
    try {
      emit(AssignmentLoading());
      // TODO: Implement actual update assignment logic
      final assignments = MockDataService.getMockAssignments();
      emit(AssignmentsLoaded(assignments));
    } catch (e) {
      emit(AssignmentError(e.toString()));
    }
  }

  Future<void> _onDeleteAssignment(
    DeleteAssignmentEvent event,
    Emitter<AssignmentState> emit,
  ) async {
    try {
      emit(AssignmentLoading());
      // TODO: Implement actual delete assignment logic
      final assignments = MockDataService.getMockAssignments();
      emit(AssignmentsLoaded(assignments));
    } catch (e) {
      emit(AssignmentError(e.toString()));
    }
  }
} 
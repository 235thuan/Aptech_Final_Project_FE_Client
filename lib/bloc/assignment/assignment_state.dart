import 'package:equatable/equatable.dart';
import '../../core/models/assignment.dart';

// States
abstract class AssignmentState extends Equatable {
  const AssignmentState();

  @override
  List<Object?> get props => [];
}

class AssignmentInitial extends AssignmentState {}

class AssignmentLoading extends AssignmentState {}

class AssignmentsLoaded extends AssignmentState {
  final List<Assignment> assignments;

  const AssignmentsLoaded(this.assignments);

  @override
  List<Object?> get props => [assignments];
}

class AssignmentError extends AssignmentState {
  final String message;

  const AssignmentError(this.message);

  @override
  List<Object?> get props => [message];
} 
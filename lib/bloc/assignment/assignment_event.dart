import 'package:equatable/equatable.dart';
import '../../core/models/assignment.dart';

// Events
abstract class AssignmentEvent extends Equatable {
  const AssignmentEvent();

  @override
  List<Object?> get props => [];
}

class AssignmentsLoadedEvent extends AssignmentEvent {
  final List<Assignment> assignments;

  const AssignmentsLoadedEvent(this.assignments);

  @override
  List<Object?> get props => [assignments];
}

class AddAssignmentEvent extends AssignmentEvent {
  final Assignment assignment;

  const AddAssignmentEvent(this.assignment);

  @override
  List<Object?> get props => [assignment];
}

class UpdateAssignmentEvent extends AssignmentEvent {
  final Assignment assignment;

  const UpdateAssignmentEvent(this.assignment);

  @override
  List<Object?> get props => [assignment];
}

class DeleteAssignmentEvent extends AssignmentEvent {
  final String assignmentId;

  const DeleteAssignmentEvent(this.assignmentId);

  @override
  List<Object?> get props => [assignmentId];
} 
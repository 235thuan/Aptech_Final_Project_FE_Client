import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../core/models/class.dart';
import '../../core/services/class_service.dart';

// Events
abstract class ClassEvent extends Equatable {
  const ClassEvent();

  @override
  List<Object?> get props => [];
}

class LoadClasses extends ClassEvent {}

class AddClass extends ClassEvent {
  final String name;
  final String description;
  final String courseId;
  final String courseName;
  final String teacherId;
  final String teacherName;
  final String schedule;
  final String startDate;
  final String endDate;
  final int capacity;
  final int currentStudents;
  final String status;

  const AddClass({
    required this.name,
    required this.description,
    required this.courseId,
    required this.courseName,
    required this.teacherId,
    required this.teacherName,
    required this.schedule,
    required this.startDate,
    required this.endDate,
    required this.capacity,
    required this.currentStudents,
    required this.status,
  });

  @override
  List<Object?> get props => [name, description, courseId, courseName, teacherId, teacherName, schedule, startDate, endDate, capacity, currentStudents, status];
}

class UpdateClass extends ClassEvent {
  final String id;
  final String name;
  final String description;
  final String courseId;
  final String courseName;
  final String teacherId;
  final String teacherName;
  final String schedule;
  final String startDate;
  final String endDate;
  final int capacity;
  final int currentStudents;
  final String status;

  const UpdateClass({
    required this.id,
    required this.name,
    required this.description,
    required this.courseId,
    required this.courseName,
    required this.teacherId,
    required this.teacherName,
    required this.schedule,
    required this.startDate,
    required this.endDate,
    required this.capacity,
    required this.currentStudents,
    required this.status,
  });

  @override
  List<Object?> get props => [id, name, description, courseId, courseName, teacherId, teacherName, schedule, startDate, endDate, capacity, currentStudents, status];
}

class DeleteClass extends ClassEvent {
  final String id;

  const DeleteClass(this.id);

  @override
  List<Object?> get props => [id];
}

// States
abstract class ClassState extends Equatable {
  const ClassState();

  @override
  List<Object?> get props => [];
}

class ClassInitial extends ClassState {}

class ClassLoading extends ClassState {}

class ClassLoaded extends ClassState {
  final List<Class> classes;

  const ClassLoaded(this.classes);

  @override
  List<Object?> get props => [classes];
}

class ClassError extends ClassState {
  final String message;

  const ClassError(this.message);

  @override
  List<Object?> get props => [message];
}

// BLoC
class ClassBloc extends Bloc<ClassEvent, ClassState> {
  final ClassService _classService;

  ClassBloc(this._classService) : super(ClassInitial()) {
    on<LoadClasses>(_onLoadClasses);
    on<AddClass>(_onAddClass);
    on<UpdateClass>(_onUpdateClass);
    on<DeleteClass>(_onDeleteClass);
  }

  Future<void> _onLoadClasses(
    LoadClasses event,
    Emitter<ClassState> emit,
  ) async {
    try {
      emit(ClassLoading());
      final classes = await _classService.getClasses();
      emit(ClassLoaded(classes));
    } catch (e) {
      emit(ClassError(e.toString()));
    }
  }

  Future<void> _onAddClass(
    AddClass event,
    Emitter<ClassState> emit,
  ) async {
    try {
      emit(ClassLoading());
      await _classService.addClass(
        name: event.name,
        description: event.description,
        courseId: event.courseId,
        courseName: event.courseName,
        teacherId: event.teacherId,
        teacherName: event.teacherName,
        schedule: event.schedule,
        startDate: event.startDate,
        endDate: event.endDate,
        capacity: event.capacity,
        currentStudents: event.currentStudents,
        status: event.status,
      );
      final classes = await _classService.getClasses();
      emit(ClassLoaded(classes));
    } catch (e) {
      emit(ClassError(e.toString()));
    }
  }

  Future<void> _onUpdateClass(
    UpdateClass event,
    Emitter<ClassState> emit,
  ) async {
    try {
      emit(ClassLoading());
      await _classService.updateClass(
        id: event.id,
        name: event.name,
        description: event.description,
        courseId: event.courseId,
        courseName: event.courseName,
        teacherId: event.teacherId,
        teacherName: event.teacherName,
        schedule: event.schedule,
        startDate: event.startDate,
        endDate: event.endDate,
        capacity: event.capacity,
        currentStudents: event.currentStudents,
        status: event.status,
      );
      final classes = await _classService.getClasses();
      emit(ClassLoaded(classes));
    } catch (e) {
      emit(ClassError(e.toString()));
    }
  }

  Future<void> _onDeleteClass(
    DeleteClass event,
    Emitter<ClassState> emit,
  ) async {
    try {
      emit(ClassLoading());
      await _classService.deleteClass(event.id);
      final classes = await _classService.getClasses();
      emit(ClassLoaded(classes));
    } catch (e) {
      emit(ClassError(e.toString()));
    }
  }
} 
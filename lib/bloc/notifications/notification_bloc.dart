import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../core/models/notification.dart';
import '../../core/services/notification_service.dart';

// Events
abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object?> get props => [];
}

class LoadNotifications extends NotificationEvent {}

class AddNotification extends NotificationEvent {
  final String title;
  final String content;
  final String type;
  final String priority;
  final List<String> recipients;

  const AddNotification({
    required this.title,
    required this.content,
    required this.type,
    required this.priority,
    required this.recipients,
  });

  @override
  List<Object?> get props => [title, content, type, priority, recipients];
}

class UpdateNotification extends NotificationEvent {
  final String id;
  final String title;
  final String content;
  final String type;
  final String priority;
  final List<String> recipients;

  const UpdateNotification({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.priority,
    required this.recipients,
  });

  @override
  List<Object?> get props => [id, title, content, type, priority, recipients];
}

class DeleteNotification extends NotificationEvent {
  final String id;

  const DeleteNotification(this.id);

  @override
  List<Object?> get props => [id];
}

// States
abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object?> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<Notification> notifications;

  const NotificationLoaded(this.notifications);

  @override
  List<Object?> get props => [notifications];
}

class NotificationError extends NotificationState {
  final String message;

  const NotificationError(this.message);

  @override
  List<Object?> get props => [message];
}

// BLoC
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationService _notificationService;

  NotificationBloc(this._notificationService) : super(NotificationInitial()) {
    on<LoadNotifications>(_onLoadNotifications);
    on<AddNotification>(_onAddNotification);
    on<UpdateNotification>(_onUpdateNotification);
    on<DeleteNotification>(_onDeleteNotification);
  }

  Future<void> _onLoadNotifications(
    LoadNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      emit(NotificationLoading());
      final notifications = await _notificationService.getNotifications();
      emit(NotificationLoaded(notifications));
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }

  Future<void> _onAddNotification(
    AddNotification event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      emit(NotificationLoading());
      await _notificationService.addNotification(
        title: event.title,
        content: event.content,
        type: event.type,
        priority: event.priority,
        recipients: event.recipients,
      );
      final notifications = await _notificationService.getNotifications();
      emit(NotificationLoaded(notifications));
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }

  Future<void> _onUpdateNotification(
    UpdateNotification event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      emit(NotificationLoading());
      await _notificationService.updateNotification(
        id: event.id,
        title: event.title,
        content: event.content,
        type: event.type,
        priority: event.priority,
        recipients: event.recipients,
      );
      final notifications = await _notificationService.getNotifications();
      emit(NotificationLoaded(notifications));
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }

  Future<void> _onDeleteNotification(
    DeleteNotification event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      emit(NotificationLoading());
      await _notificationService.deleteNotification(event.id);
      final notifications = await _notificationService.getNotifications();
      emit(NotificationLoaded(notifications));
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }
} 
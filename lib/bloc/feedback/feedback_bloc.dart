import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../core/models/user_feedback.dart';
import '../../core/services/feedback_service.dart';

// Events
abstract class FeedbackEvent extends Equatable {
  const FeedbackEvent();

  @override
  List<Object?> get props => [];
}

class LoadFeedbacks extends FeedbackEvent {}

class AddFeedback extends FeedbackEvent {
  final String title;
  final String content;
  final String userName;

  const AddFeedback({
    required this.title,
    required this.content,
    required this.userName,
  });

  @override
  List<Object?> get props => [title, content, userName];
}

class RespondToFeedback extends FeedbackEvent {
  final String id;
  final String response;

  const RespondToFeedback({
    required this.id,
    required this.response,
  });

  @override
  List<Object?> get props => [id, response];
}

class DeleteFeedback extends FeedbackEvent {
  final String id;

  const DeleteFeedback(this.id);

  @override
  List<Object?> get props => [id];
}

// States
abstract class FeedbackState extends Equatable {
  const FeedbackState();

  @override
  List<Object?> get props => [];
}

class FeedbackInitial extends FeedbackState {}

class FeedbackLoading extends FeedbackState {}

class FeedbackLoaded extends FeedbackState {
  final List<UserFeedback> feedbacks;

  const FeedbackLoaded(this.feedbacks);

  @override
  List<Object?> get props => [feedbacks];
}

class FeedbackError extends FeedbackState {
  final String message;

  const FeedbackError(this.message);

  @override
  List<Object?> get props => [message];
}

// BLoC
class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  final FeedbackService _feedbackService;

  FeedbackBloc(this._feedbackService) : super(FeedbackInitial()) {
    on<LoadFeedbacks>(_onLoadFeedbacks);
    on<AddFeedback>(_onAddFeedback);
    on<RespondToFeedback>(_onRespondToFeedback);
    on<DeleteFeedback>(_onDeleteFeedback);
  }

  Future<void> _onLoadFeedbacks(
    LoadFeedbacks event,
    Emitter<FeedbackState> emit,
  ) async {
    try {
      emit(FeedbackLoading());
      final feedbacks = await _feedbackService.getFeedbacks();
      emit(FeedbackLoaded(feedbacks));
    } catch (e) {
      emit(FeedbackError(e.toString()));
    }
  }

  Future<void> _onAddFeedback(
    AddFeedback event,
    Emitter<FeedbackState> emit,
  ) async {
    try {
      emit(FeedbackLoading());
      await _feedbackService.addFeedback(
        title: event.title,
        content: event.content,
        userName: event.userName,
      );
      final feedbacks = await _feedbackService.getFeedbacks();
      emit(FeedbackLoaded(feedbacks));
    } catch (e) {
      emit(FeedbackError(e.toString()));
    }
  }

  Future<void> _onRespondToFeedback(
    RespondToFeedback event,
    Emitter<FeedbackState> emit,
  ) async {
    try {
      emit(FeedbackLoading());
      await _feedbackService.respondToFeedback(
        id: event.id,
        response: event.response,
      );
      final feedbacks = await _feedbackService.getFeedbacks();
      emit(FeedbackLoaded(feedbacks));
    } catch (e) {
      emit(FeedbackError(e.toString()));
    }
  }

  Future<void> _onDeleteFeedback(
    DeleteFeedback event,
    Emitter<FeedbackState> emit,
  ) async {
    try {
      emit(FeedbackLoading());
      await _feedbackService.deleteFeedback(event.id);
      final feedbacks = await _feedbackService.getFeedbacks();
      emit(FeedbackLoaded(feedbacks));
    } catch (e) {
      emit(FeedbackError(e.toString()));
    }
  }
} 
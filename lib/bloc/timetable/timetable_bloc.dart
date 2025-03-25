import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/mock_data_service.dart';
import 'timetable_event.dart';
import 'timetable_state.dart';

// BLoC xử lý logic liên quan đến thời khóa biểu
class TimetableBloc extends Bloc<TimetableEvent, TimetableState> {
  TimetableBloc() : super(TimetableInitial()) {
    on<TimetableLoadedEvent>(_onTimetableLoaded);
    on<TimetableByDateLoadedEvent>(_onTimetableByDateLoaded);
    on<TimetableByWeekLoadedEvent>(_onTimetableByWeekLoaded);
    on<UpdateSessionStatusEvent>(_onUpdateSessionStatus);
  }

  Future<void> _onTimetableLoaded(
    TimetableLoadedEvent event,
    Emitter<TimetableState> emit,
  ) async {
    try {
      emit(TimetableLoading());
      final timetable = MockDataService.getMockTimetable();
      emit(TimetableLoaded(timetable));
    } catch (e) {
      emit(TimetableError(e.toString()));
    }
  }

  Future<void> _onTimetableByDateLoaded(
    TimetableByDateLoadedEvent event,
    Emitter<TimetableState> emit,
  ) async {
    try {
      emit(TimetableLoading());
      final timetable = MockDataService.getMockTimetable();
      emit(TimetableByDateLoaded(date: event.date, timetable: timetable));
    } catch (e) {
      emit(TimetableError(e.toString()));
    }
  }

  Future<void> _onTimetableByWeekLoaded(
    TimetableByWeekLoadedEvent event,
    Emitter<TimetableState> emit,
  ) async {
    try {
      emit(TimetableLoading());
      final timetable = MockDataService.getMockTimetable();
      emit(TimetableByWeekLoaded(weekStart: event.weekStart, timetable: timetable));
    } catch (e) {
      emit(TimetableError(e.toString()));
    }
  }

  Future<void> _onUpdateSessionStatus(
    UpdateSessionStatusEvent event,
    Emitter<TimetableState> emit,
  ) async {
    try {
      emit(TimetableLoading());
      // TODO: Implement actual status update logic
      emit(SessionStatusUpdated(
        sessionId: event.sessionId,
        status: event.status,
      ));
    } catch (e) {
      emit(TimetableError(e.toString()));
    }
  }
} 
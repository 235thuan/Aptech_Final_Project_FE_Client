import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/timetable_service.dart';
import 'timetable_event.dart';
import 'timetable_state.dart';

// BLoC xử lý logic liên quan đến thời khóa biểu
class TimetableBloc extends Bloc<TimetableEvent, TimetableState> {
  final TimetableService _timetableService;

  TimetableBloc(this._timetableService) : super(TimetableInitial()) {
    // Xử lý sự kiện lấy thời khóa biểu của sinh viên
    on<GetStudentTimetableEvent>((event, emit) async {
      try {
        emit(TimetableLoading());
        final timetable = await _timetableService.getStudentTimetable(event.studentId);
        emit(TimetableLoaded(timetable));
      } catch (e) {
        emit(TimetableError(e.toString()));
      }
    });

    // Xử lý sự kiện lấy thời khóa biểu theo ngày
    on<GetTimetableByDateEvent>((event, emit) async {
      try {
        emit(TimetableLoading());
        final timetable = await _timetableService.getTimetableByDate(
          event.studentId,
          event.date,
        );
        emit(TimetableByDateLoaded(
          timetable: timetable,
          date: event.date,
        ));
      } catch (e) {
        emit(TimetableError(e.toString()));
      }
    });

    // Xử lý sự kiện lấy thời khóa biểu theo tuần
    on<GetTimetableByWeekEvent>((event, emit) async {
      try {
        emit(TimetableLoading());
        final timetable = await _timetableService.getTimetableByWeek(
          event.studentId,
          event.weekStart,
        );
        emit(TimetableByWeekLoaded(
          timetable: timetable,
          weekStart: event.weekStart,
        ));
      } catch (e) {
        emit(TimetableError(e.toString()));
      }
    });

    // Xử lý sự kiện lấy thời khóa biểu theo tháng
    on<GetTimetableByMonthEvent>((event, emit) async {
      try {
        emit(TimetableLoading());
        final timetable = await _timetableService.getTimetableByMonth(
          event.studentId,
          event.monthStart,
        );
        emit(TimetableByMonthLoaded(
          timetable: timetable,
          monthStart: event.monthStart,
        ));
      } catch (e) {
        emit(TimetableError(e.toString()));
      }
    });

    // Xử lý sự kiện cập nhật trạng thái buổi học
    on<UpdateSessionStatusEvent>((event, emit) async {
      try {
        emit(TimetableLoading());
        final success = await _timetableService.updateSessionStatus(
          event.sessionId,
          event.status,
        );

        if (success) {
          emit(SessionStatusUpdated(
            sessionId: event.sessionId,
            status: event.status,
          ));
        } else {
          emit(TimetableError('Cập nhật trạng thái buổi học thất bại'));
        }
      } catch (e) {
        emit(TimetableError(e.toString()));
      }
    });
  }
} 
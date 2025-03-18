import '../../core/models/timetable.dart';

// Các trạng thái liên quan đến thời khóa biểu
abstract class TimetableState {}

// Trạng thái khởi tạo
class TimetableInitial extends TimetableState {}

// Trạng thái đang xử lý
class TimetableLoading extends TimetableState {}

// Trạng thái lấy thời khóa biểu thành công
class TimetableLoaded extends TimetableState {
  final List<Timetable> timetable;

  TimetableLoaded(this.timetable);
}

// Trạng thái lấy thời khóa biểu theo ngày thành công
class TimetableByDateLoaded extends TimetableState {
  final List<Timetable> timetable;
  final DateTime date;

  TimetableByDateLoaded({
    required this.timetable,
    required this.date,
  });
}

// Trạng thái lấy thời khóa biểu theo tuần thành công
class TimetableByWeekLoaded extends TimetableState {
  final List<Timetable> timetable;
  final DateTime weekStart;

  TimetableByWeekLoaded({
    required this.timetable,
    required this.weekStart,
  });
}

// Trạng thái lấy thời khóa biểu theo tháng thành công
class TimetableByMonthLoaded extends TimetableState {
  final List<Timetable> timetable;
  final DateTime monthStart;

  TimetableByMonthLoaded({
    required this.timetable,
    required this.monthStart,
  });
}

// Trạng thái cập nhật trạng thái buổi học thành công
class SessionStatusUpdated extends TimetableState {
  final String sessionId;
  final String status;

  SessionStatusUpdated({
    required this.sessionId,
    required this.status,
  });
}

// Trạng thái lỗi
class TimetableError extends TimetableState {
  final String message;

  TimetableError(this.message);
}
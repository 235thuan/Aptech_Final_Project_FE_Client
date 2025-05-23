import '../../core/models/timetable.dart';

// Các sự kiện liên quan đến thời khóa biểu
abstract class TimetableEvent {}

// Sự kiện lấy thời khóa biểu của sinh viên
class GetStudentTimetableEvent extends TimetableEvent {
  final String studentId;

  GetStudentTimetableEvent(this.studentId);
}

// Sự kiện lấy thời khóa biểu theo ngày
class GetTimetableByDateEvent extends TimetableEvent {
  final String studentId;
  final DateTime date;

  GetTimetableByDateEvent({
    required this.studentId,
    required this.date,
  });
}

// Sự kiện lấy thời khóa biểu theo tuần
class GetTimetableByWeekEvent extends TimetableEvent {
  final String studentId;
  final DateTime weekStart;

  GetTimetableByWeekEvent({
    required this.studentId,
    required this.weekStart,
  });
}

// Sự kiện lấy thời khóa biểu theo tháng
class GetTimetableByMonthEvent extends TimetableEvent {
  final String studentId;
  final DateTime monthStart;

  GetTimetableByMonthEvent({
    required this.studentId,
    required this.monthStart,
  });
}

// Sự kiện cập nhật trạng thái buổi học
class UpdateSessionStatusEvent extends TimetableEvent {
  final String sessionId;
  final String status;

  UpdateSessionStatusEvent({
    required this.sessionId,
    required this.status,
  });
}

// Sự kiện khi tải thời khóa biểu
class TimetableLoadedEvent extends TimetableEvent {
  final List<Timetable> timetable;
  TimetableLoadedEvent(this.timetable);
}

// Sự kiện khi tải thời khóa biểu theo ngày
class TimetableByDateLoadedEvent extends TimetableEvent {
  final DateTime date;
  final List<Timetable> timetable;
  TimetableByDateLoadedEvent(this.date, this.timetable);
}

// Sự kiện khi tải thời khóa biểu theo tuần
class TimetableByWeekLoadedEvent extends TimetableEvent {
  final DateTime weekStart;
  final List<Timetable> timetable;
  TimetableByWeekLoadedEvent(this.weekStart, this.timetable);
} 
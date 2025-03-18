// Model cho thông tin thời khóa biểu
class Timetable {
  final String id;
  final String studentId;
  final String courseId;
  final String courseName;
  final String courseCode;
  final String instructor;
  final String location;
  final String dayOfWeek; // Thứ trong tuần
  final String startTime; // Thời gian bắt đầu
  final String endTime; // Thời gian kết thúc
  final DateTime startDate; // Ngày bắt đầu học
  final DateTime endDate; // Ngày kết thúc học
  final String status; // Trạng thái (active, completed, cancelled)

  Timetable({
    required this.id,
    required this.studentId,
    required this.courseId,
    required this.courseName,
    required this.courseCode,
    required this.instructor,
    required this.location,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  // Chuyển đổi từ JSON sang đối tượng Timetable
  factory Timetable.fromJson(Map<String, dynamic> json) {
    return Timetable(
      id: json['id'],
      studentId: json['studentId'],
      courseId: json['courseId'],
      courseName: json['courseName'],
      courseCode: json['courseCode'],
      instructor: json['instructor'],
      location: json['location'],
      dayOfWeek: json['dayOfWeek'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      status: json['status'],
    );
  }

  // Chuyển đổi từ đối tượng Timetable sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'courseId': courseId,
      'courseName': courseName,
      'courseCode': courseCode,
      'instructor': instructor,
      'location': location,
      'dayOfWeek': dayOfWeek,
      'startTime': startTime,
      'endTime': endTime,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'status': status,
    };
  }

  // Tạo bản sao của Timetable với một số thay đổi
  Timetable copyWith({
    String? id,
    String? studentId,
    String? courseId,
    String? courseName,
    String? courseCode,
    String? instructor,
    String? location,
    String? dayOfWeek,
    String? startTime,
    String? endTime,
    DateTime? startDate,
    DateTime? endDate,
    String? status,
  }) {
    return Timetable(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      courseId: courseId ?? this.courseId,
      courseName: courseName ?? this.courseName,
      courseCode: courseCode ?? this.courseCode,
      instructor: instructor ?? this.instructor,
      location: location ?? this.location,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
    );
  }
} 
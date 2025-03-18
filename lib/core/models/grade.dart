// Model cho thông tin điểm số
class Grade {
  final String id;
  final String studentId;
  final String courseId;
  final String courseName;
  final String courseCode;
  final String instructor;
  final double attendanceScore; // Điểm chuyên cần
  final double midtermScore; // Điểm giữa kỳ
  final double finalScore; // Điểm cuối kỳ
  final double averageScore; // Điểm trung bình
  final String grade; // Điểm chữ (A, B, C, D, F)
  final String semester; // Học kỳ
  final String academicYear; // Năm học
  final DateTime lastUpdated; // Thời gian cập nhật cuối cùng

  Grade({
    required this.id,
    required this.studentId,
    required this.courseId,
    required this.courseName,
    required this.courseCode,
    required this.instructor,
    required this.attendanceScore,
    required this.midtermScore,
    required this.finalScore,
    required this.averageScore,
    required this.grade,
    required this.semester,
    required this.academicYear,
    required this.lastUpdated,
  });

  // Chuyển đổi từ JSON sang đối tượng Grade
  factory Grade.fromJson(Map<String, dynamic> json) {
    return Grade(
      id: json['id'],
      studentId: json['studentId'],
      courseId: json['courseId'],
      courseName: json['courseName'],
      courseCode: json['courseCode'],
      instructor: json['instructor'],
      attendanceScore: json['attendanceScore'].toDouble(),
      midtermScore: json['midtermScore'].toDouble(),
      finalScore: json['finalScore'].toDouble(),
      averageScore: json['averageScore'].toDouble(),
      grade: json['grade'],
      semester: json['semester'],
      academicYear: json['academicYear'],
      lastUpdated: DateTime.parse(json['lastUpdated']),
    );
  }

  // Chuyển đổi từ đối tượng Grade sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'courseId': courseId,
      'courseName': courseName,
      'courseCode': courseCode,
      'instructor': instructor,
      'attendanceScore': attendanceScore,
      'midtermScore': midtermScore,
      'finalScore': finalScore,
      'averageScore': averageScore,
      'grade': grade,
      'semester': semester,
      'academicYear': academicYear,
      'lastUpdated': lastUpdated.toIso8601String(),
    };
  }

  // Tạo bản sao của Grade với một số thay đổi
  Grade copyWith({
    String? id,
    String? studentId,
    String? courseId,
    String? courseName,
    String? courseCode,
    String? instructor,
    double? attendanceScore,
    double? midtermScore,
    double? finalScore,
    double? averageScore,
    String? grade,
    String? semester,
    String? academicYear,
    DateTime? lastUpdated,
  }) {
    return Grade(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      courseId: courseId ?? this.courseId,
      courseName: courseName ?? this.courseName,
      courseCode: courseCode ?? this.courseCode,
      instructor: instructor ?? this.instructor,
      attendanceScore: attendanceScore ?? this.attendanceScore,
      midtermScore: midtermScore ?? this.midtermScore,
      finalScore: finalScore ?? this.finalScore,
      averageScore: averageScore ?? this.averageScore,
      grade: grade ?? this.grade,
      semester: semester ?? this.semester,
      academicYear: academicYear ?? this.academicYear,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
} 
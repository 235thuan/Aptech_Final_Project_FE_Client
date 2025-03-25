// Model cho thông tin điểm số
class Grade {
  final String id;
  final String studentId;
  final String studentName;
  final String courseId;
  final String courseName;
  final String courseCode;
  final String instructor;
  final String assignmentId;
  final String assignmentTitle;
  final double attendanceScore;
  final double midtermScore;
  final double finalScore;
  final double averageScore;
  final double score;
  final String grade;
  final String? comment;
  final String semester;
  final String academicYear;
  final DateTime lastUpdated;

  Grade({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.courseId,
    required this.courseName,
    required this.courseCode,
    required this.instructor,
    required this.assignmentId,
    required this.assignmentTitle,
    required this.attendanceScore,
    required this.midtermScore,
    required this.finalScore,
    required this.averageScore,
    required this.score,
    required this.grade,
    this.comment,
    required this.semester,
    required this.academicYear,
    required this.lastUpdated,
  });

  // Chuyển đổi từ JSON sang đối tượng Grade
  factory Grade.fromJson(Map<String, dynamic> json) {
    return Grade(
      id: json['id'],
      studentId: json['studentId'],
      studentName: json['studentName'],
      courseId: json['courseId'],
      courseName: json['courseName'],
      courseCode: json['courseCode'],
      instructor: json['instructor'],
      assignmentId: json['assignmentId'],
      assignmentTitle: json['assignmentTitle'],
      attendanceScore: json['attendanceScore'].toDouble(),
      midtermScore: json['midtermScore'].toDouble(),
      finalScore: json['finalScore'].toDouble(),
      averageScore: json['averageScore'].toDouble(),
      score: json['score'].toDouble(),
      grade: json['grade'],
      comment: json['comment'],
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
      'studentName': studentName,
      'courseId': courseId,
      'courseName': courseName,
      'courseCode': courseCode,
      'instructor': instructor,
      'assignmentId': assignmentId,
      'assignmentTitle': assignmentTitle,
      'attendanceScore': attendanceScore,
      'midtermScore': midtermScore,
      'finalScore': finalScore,
      'averageScore': averageScore,
      'score': score,
      'grade': grade,
      'comment': comment,
      'semester': semester,
      'academicYear': academicYear,
      'lastUpdated': lastUpdated.toIso8601String(),
    };
  }

  // Tạo bản sao của Grade với một số thay đổi
  Grade copyWith({
    String? id,
    String? studentId,
    String? studentName,
    String? courseId,
    String? courseName,
    String? courseCode,
    String? instructor,
    String? assignmentId,
    String? assignmentTitle,
    double? attendanceScore,
    double? midtermScore,
    double? finalScore,
    double? averageScore,
    double? score,
    String? grade,
    String? comment,
    String? semester,
    String? academicYear,
    DateTime? lastUpdated,
  }) {
    return Grade(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      studentName: studentName ?? this.studentName,
      courseId: courseId ?? this.courseId,
      courseName: courseName ?? this.courseName,
      courseCode: courseCode ?? this.courseCode,
      instructor: instructor ?? this.instructor,
      assignmentId: assignmentId ?? this.assignmentId,
      assignmentTitle: assignmentTitle ?? this.assignmentTitle,
      attendanceScore: attendanceScore ?? this.attendanceScore,
      midtermScore: midtermScore ?? this.midtermScore,
      finalScore: finalScore ?? this.finalScore,
      averageScore: averageScore ?? this.averageScore,
      score: score ?? this.score,
      grade: grade ?? this.grade,
      comment: comment ?? this.comment,
      semester: semester ?? this.semester,
      academicYear: academicYear ?? this.academicYear,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
} 
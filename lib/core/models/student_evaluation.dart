// Model cho thông tin đánh giá học sinh
class StudentEvaluation {
  final String id;
  final String studentId;
  final String studentName;
  final String className;
  final DateTime date;
  final double attendance;
  final double participation;
  final double homework;
  final double quiz;
  final double exam;
  final double totalScore;
  final String comment;

  StudentEvaluation({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.className,
    required this.date,
    required this.attendance,
    required this.participation,
    required this.homework,
    required this.quiz,
    required this.exam,
    required this.totalScore,
    required this.comment,
  });

  // Chuyển đổi từ JSON sang đối tượng StudentEvaluation
  factory StudentEvaluation.fromJson(Map<String, dynamic> json) {
    return StudentEvaluation(
      id: json['id'],
      studentId: json['studentId'],
      studentName: json['studentName'],
      className: json['className'],
      date: DateTime.parse(json['date']),
      attendance: json['attendance'].toDouble(),
      participation: json['participation'].toDouble(),
      homework: json['homework'].toDouble(),
      quiz: json['quiz'].toDouble(),
      exam: json['exam'].toDouble(),
      totalScore: json['totalScore'].toDouble(),
      comment: json['comment'],
    );
  }

  // Chuyển đổi từ đối tượng StudentEvaluation sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'studentName': studentName,
      'className': className,
      'date': date.toIso8601String(),
      'attendance': attendance,
      'participation': participation,
      'homework': homework,
      'quiz': quiz,
      'exam': exam,
      'totalScore': totalScore,
      'comment': comment,
    };
  }
} 
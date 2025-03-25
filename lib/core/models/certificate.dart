class Certificate {
  final String id;
  final String name;
  final String studentId;
  final String studentName;
  final String courseId;
  final String courseName;
  final DateTime issuedDate;
  final DateTime expiryDate;
  final String status;
  final String certificateNumber;

  Certificate({
    required this.id,
    required this.name,
    required this.studentId,
    required this.studentName,
    required this.courseId,
    required this.courseName,
    required this.issuedDate,
    required this.expiryDate,
    required this.status,
    required this.certificateNumber,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      id: json['id'],
      name: json['name'],
      studentId: json['studentId'],
      studentName: json['studentName'],
      courseId: json['courseId'],
      courseName: json['courseName'],
      issuedDate: DateTime.parse(json['issuedDate']),
      expiryDate: DateTime.parse(json['expiryDate']),
      status: json['status'],
      certificateNumber: json['certificateNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'studentId': studentId,
      'studentName': studentName,
      'courseId': courseId,
      'courseName': courseName,
      'issuedDate': issuedDate.toIso8601String(),
      'expiryDate': expiryDate.toIso8601String(),
      'status': status,
      'certificateNumber': certificateNumber,
    };
  }
} 
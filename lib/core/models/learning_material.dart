// Model cho thông tin tài liệu học tập
class LearningMaterial {
  final String id;
  final String courseId;
  final String courseName;
  final String className;
  final String title;
  final String description;
  final String fileUrl;
  final String type;
  final String uploadedBy;
  final DateTime uploadedAt;
  final int fileSize;
  final String status;

  LearningMaterial({
    required this.id,
    required this.courseId,
    required this.courseName,
    required this.className,
    required this.title,
    required this.description,
    required this.fileUrl,
    required this.type,
    required this.uploadedBy,
    required this.uploadedAt,
    required this.fileSize,
    required this.status,
  });

  // Chuyển đổi từ JSON sang đối tượng LearningMaterial
  factory LearningMaterial.fromJson(Map<String, dynamic> json) {
    return LearningMaterial(
      id: json['id'],
      courseId: json['courseId'],
      courseName: json['courseName'],
      className: json['className'],
      title: json['title'],
      description: json['description'],
      fileUrl: json['fileUrl'],
      type: json['type'],
      uploadedBy: json['uploadedBy'],
      uploadedAt: DateTime.parse(json['uploadedAt']),
      fileSize: json['fileSize'],
      status: json['status'],
    );
  }

  // Chuyển đổi từ đối tượng LearningMaterial sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseId': courseId,
      'courseName': courseName,
      'className': className,
      'title': title,
      'description': description,
      'fileUrl': fileUrl,
      'type': type,
      'uploadedBy': uploadedBy,
      'uploadedAt': uploadedAt.toIso8601String(),
      'fileSize': fileSize,
      'status': status,
    };
  }
} 